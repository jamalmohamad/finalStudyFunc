-module(a).
-export([foo/0, foo/1, fib/1]).

foo() -> 
    1.

foo(X) ->
    X + 1.



fib(0) -> 1;
fib(1) -> 1;
fib(N) 
  when is_integer(N) ,N > 1 ->
      fib(N-1) + fib(N-2).

