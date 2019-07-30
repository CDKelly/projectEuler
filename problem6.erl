-module(problem6).
-compile(export_all).

%%Finds the difference between the sum of the squares of the
%%first N natural numbers and the square of the sum
get_sum_square_diff(N) ->
	Sum_Of_Squares = get_sum_of_squares(N),
	Square_Of_Sum = get_square_of_sum(N),
	Square_Of_Sum - Sum_Of_Squares.

get_sum_of_squares(N) ->
	lists:sum(lists:map(fun(X) -> math:pow(X, 2) end, [Y || Y <- lists:seq(1, N)])).

get_square_of_sum(N) ->
	math:pow(lists:sum([Y || Y <- lists:seq(1, N)]), 2).