-module(dictionary_api).
-export([new_dict/1, insert/2, get/2]).
-export([delete/2, delete_dict/1]).

new_dict(TableName)->
    ets:new(TableName, [named_table, public, duplicate_bag]).

insert(TableName, Second_field)->
    {First_field,_} = calendar:universal_time(),
    ets:insert(TableName, {First_field, Second_field}).

delete_dict(TableName)->
    ets:delete(TableName).

delete(TableName, Date)->
    ets:delete(TableName, Date).

get(TableName, Date)->
    ets:lookup(TableName, Date).
