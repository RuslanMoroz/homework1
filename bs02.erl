-module(bs02).
-export([words/1]).

words(A)->
    words(A, <<>>, []).

words(<<>>, Acc, Head)->
    lists:reverse([Acc|Head]);

words(<<" ", Rest/binary>>, Acc, [])->
    words(Rest, <<>>, [<<Acc/binary>>]);

words(<<" ", Rest/binary>>, Acc, Head)->
    words(Rest, <<>>, [<<Acc/binary>>|Head]);

words(<<X, Rest/binary>>, Acc, Head)->
    words(Rest, <<Acc/binary, X>>, Head).