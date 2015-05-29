-module(p11).
-export([encode_modified/1]).

encode_modified([])->
    [];

encode_modified(Code)->
    encode(Code, [], []).

encode([H|T], [], Acc)->
    encode(T, [H], Acc);

encode([H|T], [H|_]=Acc, Acc1)->
    encode(T, [H|Acc], Acc1);

encode([H|T], [H1|_]=Acc, Acc1)->
    case length(Acc) of
         1 ->
    encode(T, [H], [H1|Acc1]);
         _ ->
    encode(T, [H], [{length(Acc), H1}|Acc1])
    end;

encode([], [H|_]=Acc, Acc1)->
    case length(Acc) of
          1 ->
    lists:reverse([Acc|Acc1]);
          _ ->
    lists:reverse([{length(Acc), H}|Acc1])
end.
