-module(problem10).
-compile(export_all).

%%Finds the sum of the prime numbers from 2 to N, inclusive
get_sum_of_prime_nos_up_to_N(N) ->
	lists:sum([X || X <- lists:seq(2,N), is_prime(X)]).


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