-module(p04).
-export([len/1]).

len(L)->
    len(L, 0).

len([], N)->
N;
len([_H|T], N)->
    N1=N+1,
    len(T, N1).