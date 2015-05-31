#! /usr/bin/env python

import sys
from fibonacci import *

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
