-module(problem8).
-compile(export_all).


%%Finds the A adjacent digits that have the largest
%%product in the given number N
get_largest_product_in_series(A, N) ->
	N_List = make_int_list(N),
	Length_Of_N_List = length(N_List),
	if
		A >= Length_Of_N_List ->
			io:format("~w~n", [N_List]),
			lists:foldl(fun(X, Prod) -> X * Prod end, 1, N_List);
		A < Length_Of_N_List ->
			Starting_Sublist = lists:sublist(N_List, 1, A),
			L = get_sublist_with_max_product(A, 1, N_List, Starting_Sublist, [], 0),
			io:format("~w~n", [L]),
			lists:foldl(fun(X, Prod) -> X * Prod end, 1, L)
	end.


get_sublist_with_max_product(A, I, N_List, _, Max_Sublist, _) when I > ((length(N_List) - A) + 1) -> Max_Sublist;
get_sublist_with_max_product(A, I, N_List, Curr_Sublist, Max_Sublist, Curr_Max) ->
	Curr_Product = lists:foldl(fun(X, Prod) -> X * Prod end, 1, Curr_Sublist),
	Abs_Max = math:pow(9, A),
	New_Index = I + 1,
	New_Sublist = lists:sublist(N_List, New_Index, A),
	%%io:format("Curr Max Sublist: ~w~n", [Max_Sublist]),
	%%io:format("Curr Max: ~p~n", [Curr_Max]),
	%%io:format("Curr Sublist: ~w~n", [Curr_Sublist]),
	%%io:format("Curr Prod: ~p~n", [Curr_Product]),
	%%io:format("New I: ~p~n", [New_Index]),
	%%io:format("New Sublist: ~w~n~n", [New_Sublist]),
	if
		Curr_Product == Abs_Max -> Curr_Sublist;
		Curr_Product > Curr_Max -> get_sublist_with_max_product(A, New_Index, N_List, New_Sublist, Curr_Sublist, Curr_Product);
		Curr_Product =< Curr_Max -> get_sublist_with_max_product(A, New_Index, N_List, New_Sublist, Max_Sublist, Curr_Max)
	end.


make_int_list(0) -> [0];
make_int_list(N) when N > 0 -> make_int_list(N, []).

make_int_list(0, Acc) -> Acc;
make_int_list(N, Acc) ->
    Digit = N rem 10,
    Number = N div 10,
    make_int_list(Number, [Digit|Acc]).