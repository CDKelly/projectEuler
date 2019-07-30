-module(problem21).
-compile(export_all).


%% takes a number A and returns [A, B] if A and B are amicable
%% numbers; returns "not part of an amicable pair" otherwise
%% In an amicable number pair, the sum of the factors of A less than A is B
%% and vice versa
return_amicable_number_pair(A) ->
    List_of_Factors_1st_Num = get_factors(A),
    Sum_of_Factors_1st_Num = lists:sum(List_of_Factors_1st_Num),
    List_of_Factors_2nd_Num = get_factors(Sum_of_Factors_1st_Num),
    Sum_of_Factors_2nd_Num = lists:sum(List_of_Factors_2nd_Num),
    case A =:= Sum_of_Factors_2nd_Num of
	true -> [A, Sum_of_Factors_1st_Num];
	false -> not_part_of_an_amicable_pair
    end.


get_factors(N) ->
    [X || X <- lists:seq(1, N-1), N rem X =:= 0].

