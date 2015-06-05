var WebSocketServer = require('ws').Server
var http = require("http")
var express = require("express")
var app = express()
var port = 5000
var exec = require('child_process').exec
var bodyParser = require('body-parser')

function execInSequence(commands, ws) {
    var languages = Object.keys(commands)
    if (languages.length === 0) {
        return
    }

    var lang = languages.shift()
    var start = Date.now()
    exec(commands[lang], function(err, stdout, stderr) {
        var output = {
            language: lang,
            result: stdout.trim(),
            time_spent: Date.now() - start,
        }
        ws.send(JSON.stringify(output), function() {})
        console.log(output)

        delete commands[lang]
        execInSequence(commands, ws)
    })
}

app.use(bodyParser.urlencoded({extended: true}))

app.get('/', function(req, res) {
    res.sendFile(__dirname + '/index.html')
})

app.get('/fibonacci/:fib', function(req, res) {
    var fib = req.params.fib
    var by = req.query.by

    var start = Date.now()
    exec('ruby ' + __dirname + '/Ruby/main.rb -m ' + by + ' ' + fib, function(err, stdout, stderr) {
        res.send(
            stdout + '<br>'
            + 'Time used: ' + (Date.now() - start) + 'ms'
        )
    })
})

app.get('/fibonacci', function(req, res) {
    res.sendFile(__dirname + '/fibonacci.html')
})

app.post('/fibonacci', function(req, res) {
    console.log(req.body)
    res.json(req.body)
})

var server = http.createServer(app)
server.listen(port)

console.log("http server listening on %d", port)

var wss = new WebSocketServer({server: server})
console.log("websocket server connected")

wss.on("connection", function(ws) {
    console.log("websocket connection open")

    ws.on("open", function open() {
        console.log("connected")
    })

    ws.on("message", function message(data, flags) {
        console.log(data, flags)

        var params = JSON.parse(data)
        var commands = {
            ruby: 'ruby ' + __dirname + '/Ruby/main.rb -m ' + params.method + ' ' + params.number.toString(10),
            php: 'php ' + __dirname + '/PHP/main.php -m ' + params.method + ' ' + params.number.toString(10),
            python: 'python ' + __dirname + '/Python/main.py -m ' + params.method + ' ' + params.number.toString(10),
        }

        execInSequence(commands, ws)
    })

    ws.on("close", function() {
        console.log("websocket connection close")
    })
})
