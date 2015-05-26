-module(p05).
-export([reverse/1]).

reverse(L)->
    reverse(L, []).

reverse([], ReverseList)->
    ReverseList;
reverse([H|T], ReverseList)->
    ReverseList1=[H|ReverseList],
    reverse(T, ReverseList1).
