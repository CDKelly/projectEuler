-module(problem3).
-export([get_list_of_prime_factors/1]).
-compile(export_all).

%%Finds all the prime factors of a given number N
get_list_of_prime_factors(N) -> get_list_of_prime_factors(N, is_prime(N), []).

get_list_of_prime_factors(N, _, _) when N =< 1 -> [];
get_list_of_prime_factors(N, true, Acc) ->
	[prevent_str_representation | [N|Acc]];
%%Added atom to prevent numbers that represent
%%strings from representing strings (e.g. 11 -> "\v", 13 -> "\r")
%%Look into binary:encode_unsigned
get_list_of_prime_factors(N, false, Acc) ->
	[Q, P] = get_largest_and_smallest_factors(N),
	get_list_of_prime_factors(Q, is_prime(Q), [P|Acc]).




is_prime(N) ->
	case N of
		N when N =< 1 -> false;
		N when N == 2 -> true;
		N when N > 2 -> is_prime(N, 2)
	end.

is_prime(N, N) -> true;
is_prime(N, M) ->
	Rem = N rem M,
	if
		Rem == 0 -> false;
		Rem > 0 -> is_prime(N, M+1)
	end.


%%Finds the largest and smallest factors of a given number N
%%(other than N and itself)
get_largest_and_smallest_factors(N) -> get_largest_and_smallest_factors(N, 2).

get_largest_and_smallest_factors(N, N) -> [N, 1];
get_largest_and_smallest_factors(N, M) ->
	Rem = N rem M,
	if
		Rem == 0 -> [N div M, M];
		Rem > 0 -> get_largest_and_smallest_factors(N, M+1)
	end.