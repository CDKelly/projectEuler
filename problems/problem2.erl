-module(problem2).
-compile(export_all).


%%Finds the sum of the even numbered Fibonacci numbers up to and
%%including the Mth Fibonacci number where

%%Mth term: 	1	2	3	4	5	6	7	8
%%Fib. No.:		1	2	3	5	8	13	21	34
answer(M) ->
		lists:sum([N || N <- create_fib_list(M), N rem 2 =:= 0]).


create_fib_list(M) -> create_fib_list(M, 1, 0, []).

create_fib_list(0, _, _, Acc) -> lists:reverse(Acc);
create_fib_list(N, A, B, Acc) when N > 0 ->
		create_fib_list(N-1, A+B, A, [A+B|Acc]).

