-module(p08).
-export([compress/1]).

compress(List)->
    compress(List, [], [], false).

compare(H, H1)->
    H == H1.

compress([], _, NewList)->
    p05:reverse(NewList);

compress([H|_T]=List, Last, NewList)->
    True = compare(H, Last),
    compress(List, Last, NewList, True).

compress([H|T], _Last, NewList, true)->
    compress(T, H, NewList);

compress([H|T], _Last, NewList, false)->
    NewList1 = [H|NewList],
    compress(T, H, NewList1).