-module(p07).
-export([flatten/1, reverse/2]).

flatten(Structure)->
    flatten(reverse(Structure, []), []).

reverse([], ReverseList)->
    ReverseList;

reverse([H|T], [])->
    ReverseList1=[reverse(H, [])],
    reverse(T, ReverseList1);

reverse([H|T], ReverseList)->
    ReverseList1=[reverse(H, [])|ReverseList],
    reverse(T, ReverseList1);

reverse(E, _)->
    E.


flatten([], NewStructure)->
    NewStructure;

flatten([[_|_]=H|[T]], NewStructure)->
     io:format("~p~n",[H]),
     [T|flatten(H, NewStructure)];

flatten([H|[T]], NewStructure)->
     [T|[H]];

flatten([H|[]], NewStructure)->
     H;

flatten([[_|_]=H|[]], NewStructure)->
    H;

flatten([H|T], NewStr)->
    io:format("H:~p~nT:~p~n",[H, T]),
    [flatten(T, NewStr)|[flatten(H, NewStr)]];

flatten(H, NewStr)->
    H.
