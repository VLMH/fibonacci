#! /usr/bin/env ruby

require __dir__ + "/fibonacci.rb"

# default value
n = 10
method = 'd'

i = 0
while i < ARGV.count
    case ARGV[i]
    when '--method', '-m'
        method = ARGV[i+=1]
    else
        n = ARGV[i].to_i
    end
    i += 1
end

puts "fib(#{n}) => #{Fibonacci.new.run n, method}"
