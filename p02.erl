-module(p02).
-export([but_last/1]).

but_last([_,_] = C)->
    C;
but_last([_H|T])->
    but_last(T).