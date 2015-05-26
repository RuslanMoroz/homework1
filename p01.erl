-module(p01).
-export([last/1]).

last([A])->
    A;
last([_H|T])->
    last(T).