#! /usr/bin/env ruby

class Fibonacci
    def run(number, method)
        case method
        when 'recursion', 'r'
            return fib_recursion number
        when 'dynamic', 'd'
            return fib_dynamic number
        end
    end

    private

    def fib_recursion(n)
        return n if n <= 1
        return fib_recursion(n - 1) + fib_recursion(n - 2)
    end

    def fib_dynamic(n)
        values = [0, 1]
        (2..n).each do |i|
            values[i] = values[i - 1] + values[i - 2]
        end

        values.pop
    end
end

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
