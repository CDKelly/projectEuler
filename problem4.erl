-module(problem4).
-compile(export_all).

%%Finds the largest palindrome from the product
%%of two D digit numbers
get_longest_palindrome(D) ->
	A = get_largest_D_digit_num(D),
	B = A - 1,
	get_longest_palindrome(D, A, B, is_palindrome(A*B)).

get_longest_palindrome(_, A, B, true) ->
	io:format("~p~n", [A]),
	io:format("~p~n", [B]),
	A * B;
get_longest_palindrome(D, A, B, false) ->
	C = get_largest_D_digit_num(D-1),
	if
		A == C -> undefined;
		B == C ->
			H = A - 1,
			J = get_largest_D_digit_num(D),
			get_longest_palindrome(D, H, J, is_palindrome(H*J));
		true ->
			J = B - 1,
			get_longest_palindrome(D, A, J, is_palindrome(A*J))			
	end.



get_largest_D_digit_num(D) -> list_to_integer(lists:concat(lists:duplicate(D, "9"))).


is_palindrome(N) ->
	N_Str = integer_to_list(N),
	N_Str_Rev = string:reverse(N_Str),
	string:equal(N_Str, N_Str_Rev).
