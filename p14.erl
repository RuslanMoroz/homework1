-module(p14).
-export([duplicate/1]).

duplicate(List)->
    duplicate(List, []).

duplicate([H|T], Acc)->
    duplicate(T, [H|[H|Acc]]);

duplicate([], Acc)->
    lists:reverse(Acc).