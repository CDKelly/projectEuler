-module(problem14).
-compile(export_all).

%%Finds the number with the longest Collatz sequence up to
%%and including N. If two numbers have a Collatz sequence
%%of the same length, the tie goes to the smaller number

%%The following iterative sequence is defined for the set of positive integers:

%%		n → n/2 (n is even)
%%		n → 3n + 1 (n is odd)

%%Using the rule above and starting with 13, we generate the following sequence:

%%		13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

find_longest_Collatz_seq(N) -> find_longest_Collatz_seq(N, 1, []).

find_longest_Collatz_seq(N, _, _) when N =< 0 -> undefined;
find_longest_Collatz_seq(1, _, _) -> [1];
find_longest_Collatz_seq(N, N, Longest_Seq) ->
	io:format("~p~n", [lists:last(Longest_Seq)]),
	io:format("Length of Collatz Sequence: ~p~n", [length(Longest_Seq)]),
	Longest_Seq;
find_longest_Collatz_seq(N, M, Longest_Seq) ->
	C = get_Collatz_Seq(M),
	case length(C) > length(Longest_Seq) of
		true -> find_longest_Collatz_seq(N, M+1, C);
		false -> find_longest_Collatz_seq(N, M+1, Longest_Seq)
	end.


get_Collatz_Seq(N) -> get_Collatz_Seq(N, [N]).

get_Collatz_Seq(N, _) when N =< 0 -> undefined;
get_Collatz_Seq(1, Acc) -> Acc;
get_Collatz_Seq(N, Acc) ->
	case N rem 2 == 0 of
		true ->
			M = N div 2,
			get_Collatz_Seq(M, [M|Acc]);
		false ->
			M = (3*N) + 1,
			get_Collatz_Seq(M, [M|Acc])
	end.