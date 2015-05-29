-module(p09).
-export([pack/1]).

pack(List)->
    pack(List, [], []).

pack([], Acc, Acc1)->
    lists:reverse([Acc|Acc1]);

pack([H|T], [], [])->
    pack(T, [H], []);

pack([H|T], [H|_]=Acc, Acc1)->
    pack(T, [H|Acc], Acc1);

pack([H|T], Acc, Acc1)->
    pack(T, [H], [Acc|Acc1]).
