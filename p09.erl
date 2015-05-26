-module(p09).
-export([pack/1]).

pack(List)->
    pack(List, [], false).

compare(H, H1)->
    H == H1.

pack([], _, NewList)->
    p05:reverse(NewList);

pack([H|T], NewList, false)->
    Head = pack([H|T],NewList, true),
    NewList1 = [Head|NewList],
    pack(Tail, H, NewList1);

pack([H|T], NewList, true)->
    NewList1= [H|NewList],
    pack(T, H, NewList1);

pack([H|T], NewList, head)->
    NewList1 = [H|NewList],
    pack(T, H, NewList1);

pack([H|T]=List, Last, NewList)->
    True= compare(H, Last),
    pack(List, NewList, True).