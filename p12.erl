-module(p12).
-export([decode_modified/1]).


decode_modified([]) ->
    [];

decode_modified(Code) ->
    decode_modified(Code, []).

decode_modified([{_,_}=H|T], Acc) ->
    decode_modified(T, [H|Acc]);

decode_modified([H|T], Acc) ->
    decode_modified(T, [{1,H}|Acc]);

decode_modified([], Acc) ->
    lists:reverse(p13:decode(Acc)).

