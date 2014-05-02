-module(erlang_push_stream_sub).

-behaviour(websocket_client_handler).

-export([
         start_link/0,
         init/2,
         websocket_handle/3,
         websocket_info/3,
         websocket_terminate/3
        ]).

start_link() ->
    crypto:start(),
    ssl:start(),
    websocket_client:start_link("ws://192.168.1.36:9080/ws/ch1", ?MODULE, []).

init([], _ConnState) ->
    {ok, []}.

websocket_handle({ping, _}, _ConnState, State) ->
    {ok, State};

websocket_handle({text, Msg}, _ConnState, State) ->
    io:format("Received msg ~p~n", [Msg]),
    {ok, State}.

websocket_info(start, _ConnState, State) ->
    {ok, State}.

websocket_terminate(_Reason, _ConnState, _State) ->
    ok.

