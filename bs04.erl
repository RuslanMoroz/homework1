-module(bs04).
-export([decode_xml/1]).

decode_xml(XML)->
    decode_xml(XML, [], <<>>).

decode_xml(<<"</", _/binary>>, [Final], _)->
    reverse(Final);

decode_xml(<<"</", Rest/binary>>, [E|Acc], Head)->
    {_, NewRest} = get_tag(Rest),
    Acc1 = head(Acc, reverse(push_element(E, Head))),
    decode_xml(NewRest, Acc1, <<>>);

decode_xml(<<"<", Rest/binary>>, Acc, Head)->
    {Tag, NewRest} = get_tag(Rest),
    decode_xml(NewRest, [{Tag, [], []}|head(Acc, Head)], <<>>);

decode_xml(<<X, Rest/binary>>, Acc, Head)->
    decode_xml(Rest, Acc, <<Head/binary, X>>).

get_tag(Rest)->
    get_tag(Rest, <<>>).
get_tag(<<">", Rest/binary>>, Acc)->
    {Acc, Rest};
get_tag(<<X, Rest/binary>>, Acc)->
    get_tag(Rest, <<Acc/binary, X>>).

head([H|T], Head)->
    [push_element(H, Head)|T];
head(T, _)->
T.

push_element(X, <<>>)->
    X;
push_element({X, _, Value}, Value1)->
{X, [], [Value1|Value]}.

reverse({ElementName, _, Values}) ->
{ElementName, [], lists:reverse(Values)}.