#! /usr/bin/env php

<?php

class Fibonacci
{
    public function run($number = 10, $method = 'r')
    {
        switch ($method) {
            case 'recursion':
            case 'r':
                return $this->fib_recursion($number);
            case 'dynamic':
            case 'd':
                return $this->fib_dynamic($number);
        }
    }

    private function fib_recursion($n)
    {
        if ($n <= 1)
            return $n;
        return $this->fib_recursion($n - 1) + $this->fib_recursion($n - 2);
    }

    private function fib_dynamic($n)
    {
        $values = [0, 1];

        for ($i = 2; $i <= $n; $i++) {
            $values[$i] = $values[$i - 1] + $values[$i - 2];
        }

        return array_pop($values);
    }
}

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
