-module(bs03).
-export([split/2]).

split(A, B)->
    split(A, B, <<>>, []).

split(<<"-:-", Rest/binary>>, B, <<>>, [])->
    split(Rest, B, <<>>, []);

split(<<"-:-", Rest/binary>>, B, <<>>, Head)->
    split(Rest, B, <<>>, Head);

split(<<"-:-", Rest/binary>>, B, Acc, [])->
    split(Rest, B, <<>>, [<<Acc/binary>>]);

split(<<"-:-", Rest/binary>>, B, Acc, Head)->
    split(Rest, B, <<>>, [<<Acc/binary>>|Head]);

split(<<X, Rest/binary>>, B, Acc, Head)->
    split(Rest, B, <<Acc/binary, X>>, Head);

split(<<>>, _, <<>>, Head)->
    lists:reverse(Head);

split(<<>>, _, Acc, Head)->
    lists:reverse([Acc|Head]).