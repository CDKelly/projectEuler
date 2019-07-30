-module(probem1_tests).
-include_lib("eunit/include/eunit.hrl").
-import(problem1, [answer/1]).

answer_test() ->
	?assertEqual(23, answer(10)),
	?assertEqual(78, answer(20)),
	?assertEqual(195, answer(30)).