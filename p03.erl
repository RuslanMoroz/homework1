-module(p03).
-export([element_at/2]).

element_at([H|_T], 1)->
    H;
element_at([_H|T], N)->
    N1 = N-1,
    element_at(T, N1);
element_at([], _)->
    undefined.