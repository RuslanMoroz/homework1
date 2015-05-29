-module(p07).
-export([flatten/1]).

flatten(Structure)->
    p05:reverse(flatten(Structure, [])).

flatten([[_|_]=H|T], Acc)->
    flatten(T, flatten(H,Acc));

flatten([H|[]], Acc)->
    flatten([], [H|Acc]);

flatten([H|T], Acc)->
    flatten(T, [H|Acc]);


flatten([], NewStructure)->
    NewStructure.
