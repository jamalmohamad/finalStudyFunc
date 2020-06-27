%Basic erLang program

-module(md).
-export([start/0]).

start() -> 
    io:format("Hello Erlang ~n").


% 1> c(md).                    compile
% 2> md:start().               run
% 3> halt().                   terminate
% 4> q().           controlled shutdown

% compiling outside erlang shell
% $ erlc md.erl
% $ erl -noshell -s md start -s init stop



