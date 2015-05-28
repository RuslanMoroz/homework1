-module(bs01).
-export([first_word/1]).

first_word(A)->
    first_word(A, <<>>).

first_word([], Acc)->
    Acc;

first_word(<<" ", _/binary>>, Acc)->
    Acc;

first_word(<<X, Rest/binary>>, Acc) ->
    first_word(Rest, <<Acc/binary, X>>).