#! /usr/bin/env php

<?php

require "PHP/Fibonacci.php";

$n = 10;        // default fib(10)
$method = 'd';  // default use dynamic method
for ($i = 1; $i < count($argv); $i++) {
    switch($argv[$i]) {
        case '--method':
        case '-m':
            $method = $argv[++$i];
            break;
        default:
            $n = (int)$argv[$i];
    }
}
$result = (new Fibonacci())->run($n, $method);
print("fib($n) => $result\n");
