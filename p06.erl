-module(p06).
-export([is_palindrome/1]).

is_palindrome(List)->
    A = reverse(List, []),
    A == List.

reverse([], ReverseList)->
    ReverseList;

reverse([H|T], ReverseList)->
    ReverseList1=[H|ReverseList],
    reverse(T, ReverseList1).