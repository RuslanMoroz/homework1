-module(p15).
-export([replicate/2]).

replicate(List, Number) ->
    replicate(List, Number, []).
    
replicate([H|T], Number, Acc) ->
    replicate(T, Number, add_elements(H, Number, Acc));
    
replicate([], _, Acc) ->
    lists:reverse(Acc).
    
add_elements(_, 0, Acc) ->
    Acc;
    
add_elements(H, Number, Acc) ->
    add_elements(H, Number-1, [H|Acc]).