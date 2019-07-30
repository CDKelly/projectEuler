-module(problem16).
-compile(export_all).

%%Returns the sum of the digits from 2 to the Nth power
%%2^15 = 32768; 3 + 2 + 7 + 6 + 8 = 26
get_power_digit_sum(N) ->
    M = round(math:pow(2, N)),
    List_Of_Digits = make_int_list(M),
    lists:sum(List_Of_Digits).


make_int_list(0) -> [0];
make_int_list(N) when N > 0 -> make_int_list(N, []).

make_int_list(0, Acc) -> Acc;
make_int_list(N, Acc) ->
    Digit = N rem 10,
    Number = N div 10,
    make_int_list(Number, [Digit|Acc]).

