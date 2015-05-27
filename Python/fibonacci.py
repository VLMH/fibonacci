#! /usr/bin/env python

import sys

class Fibonacci:
    def fib(self, n, method):
        if method == 'recursion' or method == 'r':
            return self.__fib_recursion(n)
        elif method == 'dynamic' or method == 'd':
            return self.__fib_dynamic(n)

    def __fib_recursion(self, n):
        if n <= 1:
            return n
        else:
            return self.__fib_recursion(n - 1) + self.__fib_recursion(n - 2)

    def __fib_dynamic(self, n):
        if n < 2:
            return n

        values = [0, 1]
        for i in range(2, n+1):
            values.append(values[i - 1] + values[i - 2])

        return values.pop()

# default value
n = 10
method = 'd'

i = 1
while i < len(sys.argv):
    if sys.argv[i] == '--method' or sys.argv[i] == '-m':
        i += 1
        method = sys.argv[i]
    else:
        n = int(sys.argv[i])
    i += 1

print "fib(%d) => %d" % (n, Fibonacci().fib(n, method))
