erlang_push_stream_sub
======================

Erlang websocket client for Nginx push stream module


requirements
============

- nginx with push stream module 
- create channel ch1
- install erlang

compile
=======

./rebar get-deps

./rebar compile

run
===

erl -pa deps/**/ebin -pa ebin

Erlang R16B02 (erts-5.10.3) [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false] 

Eshell V5.10.3  (abort with ^G)
1> erlang_push_stream_sub:start_link().
{ok,<0.49.0>}
2>


publish message
===============

curl -s -v -X POST 'http://192.168.1.36:9080/pub?id=ch1' -d 'Hello Joe.'

from erlang shell will seen

Received msg <<"{\"id\":1,\"channel\":\"ch1\",\"text\":\"Hello Joe.\", \"tag\":\"1\", \"time\":\"Fri, 02 May 2014 14:27:53 GMT\", \"eventid\":\"\"}">>
