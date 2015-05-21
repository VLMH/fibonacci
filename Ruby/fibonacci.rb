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

n = 30
puts "fib(#{n}) => #{Fibonacci.new.run n, 'd'}"
