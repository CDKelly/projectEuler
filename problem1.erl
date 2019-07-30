-module(problem1).
-compile(export_all).


%%Finds the sum of all the multiples of 3 or 5 from 1 up to but not including M
answer(M) ->
    lists:sum([N || N <- lists:seq(1, M-1), N rem 3 =:= 0 orelse N rem 5 =:= 0]).