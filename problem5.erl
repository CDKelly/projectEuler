-module(problem5).
-import(problem3, [get_list_of_prime_factors/1]).
-compile(export_all).

%%Finds the smallest positive number that is evenly divisible
%%by all of the numbers from 1 to N
get_smallest_num(N) ->
	L = get_list_of_prime_factors_for_smallest_num(N),
	lists:foldl(fun(X, Prod) -> X * Prod end, 1, tl(L)).


get_list_of_prime_factors_for_smallest_num(N) when N =< 0 -> undefined;
get_list_of_prime_factors_for_smallest_num(N) when N == 1; N == 2 -> 2;
get_list_of_prime_factors_for_smallest_num(N) ->
	get_list_of_prime_factors_for_smallest_num(N, 2, []).

get_list_of_prime_factors_for_smallest_num(N, M, Acc) when M == N+1 -> Acc;
get_list_of_prime_factors_for_smallest_num(N, M, Acc) ->
	Current_Prime_Factors = get_list_of_prime_factors(M),
	Diff = Current_Prime_Factors -- Acc,
	New_Prime_Factors = Acc ++ Diff,
	%%io:format("Curr: ~w~n", [Current_Prime_Factors]),
	%%io:format("Acc: ~w~n", [Acc]),
	%%io:format("Diff: ~w~n", [Diff]),
	%%io:format("New: ~w~n~n", [New_Prime_Factors]),
	get_list_of_prime_factors_for_smallest_num(N, M+1, New_Prime_Factors).