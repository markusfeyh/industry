-module(industry_seestar_helper_test).

-include_lib("eunit/include/eunit.hrl").

prepare_select_test() ->
    Keyspace = "keyspace",
    Attributes = [{id, string},
        {value, string}],
    Schema = [{name, Keyspace}, {type, table}, {attributes, Attributes}],
    "SELECT id,value FROM keyspace.table WHERE id='id_value'"
        = industry_seestar_helper:prepare_select("keyspace", table, Schema, <<"id_value">>).

prepare_select_secondary_index_test() ->
    Keyspace = "keyspace",
    Attributes = [{id, string},
        {secondary_index, string},
        {value, string}],
    Schema = [{name, Keyspace}, {type, table}, {attributes, Attributes}],
    "SELECT id,secondary_index,value FROM keyspace.table WHERE secondary_index='secondary_index_key'"
        = industry_seestar_helper:prepare_select_secondary_index("keyspace", table, Schema, {secondary_index, <<"secondary_index_key">>}).