-module(p13).
-export([decode/1]).

decode([])->
    [];

decode(Code)->
    decode(Code, []).

decode([{0, _E}|T], Acc)->
    decode(T, Acc);

decode([{N, E}|T], Acc)->
   decode([{N-1, E}|T], [E|Acc]);

decode([], Acc)->
    lists:reverse(Acc).