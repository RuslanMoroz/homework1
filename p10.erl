-module(p10).
-export([encode/1]).

encode([])->
    [];

encode(Code)->
    encode(Code, [], []).

encode([H|T], [], Acc)->
    encode(T, [H], Acc);

encode([H|T], [H|_]=Acc, Acc1)->
    encode(T, [H|Acc], Acc1);

encode([H|T], [H1|_]=Acc, Acc1)->
    encode(T, [H], [{length(Acc), H1}|Acc1]);

encode([], [H|_]=Acc, Acc1)->
    lists:reverse([{length(Acc), H}|Acc1]).