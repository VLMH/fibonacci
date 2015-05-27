require 'minitest/autorun'
require 'minitest/benchmark'
require './fibonacci'

describe Fibonacci do
    before do
        @fib = Fibonacci.new
    end

    describe "With recursion method" do
        before do
            @method = 'r'
        end

        it "fib(5) should return 5" do
            @fib.run(5, @method).must_equal(5)
        end
    end 

    describe "With recursion method" do
        before do
            @method = 'd'
        end

        it "fib(0) should return 0" do
            @fib.run(0, @method).must_equal(0)
        end

        it "fib(1) should return 1" do
            @fib.run(1, @method).must_equal(1)
        end

        it "fib(5) should return 5" do
            @fib.run(5, @method).must_equal(5)
        end
    end
end

describe "Fibonacci Benchmark" do
    before do
        @fib = Fibonacci.new
    end

    bench_range { [1, 10, 20, 30] }

    bench_performance_linear "by recursion", 0.5 do |n|
        10.times do
            @fib.run(n, 'r')
        end
    end

    bench_performance_linear "by dynamic", 0.5 do |n|
        10.times do
            @fib.run(n, 'd')
        end
    end
end
