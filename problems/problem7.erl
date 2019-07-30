-module(problem7).
-compile(export_all).

%%Finds the Nth prime number
get_Nth_prime_num(N) when N =< 0 -> undefined;
get_Nth_prime_num(N) ->
	get_Nth_prime_num(N, 0, 2, 0).

get_Nth_prime_num(N, N, _, Curr_Prime_Num) -> Curr_Prime_Num;
get_Nth_prime_num(N, M, Curr_Num, Curr_Prime_Num) ->
	case is_prime(Curr_Num) of
		true -> get_Nth_prime_num(N, M+1, Curr_Num+1, Curr_Num);
		false -> get_Nth_prime_num(N, M, Curr_Num+1, Curr_Prime_Num)
	end.


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