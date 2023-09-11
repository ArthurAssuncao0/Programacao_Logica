% Listas - OK

ultimo([X|[]], X).
ultimo([_|Y], R) :- ultimo(Y, R).


tamanho([], 0).
tamanho([_|Y], R) :- tamanho(Y, R1),
                     R is R1 + 1.


soma([X|[]], X).
soma([X|Y], R) :- soma(Y, R1),
                  R is R1 + X.


max([X|[]], X).
max([X|Y], R) :- max(Y, R1),
                 R1 > X,
                 R is R1;
    			 max(Y, R1),
                 X > R1,
                 R is X.


retornaElemento([X|_], N, X) :- N = 1.
retornaElemento([_|Y], N, Elem) :- N1 is N - 1, 
                                   N > 1, 
                                   retornaElemento(Y, N1, Elem).


retiraElemento([], [], _).
retiraElemento([X|Y], Elem, X) :- retiraElemento(Y, Elem, X).
retiraElemento([Z|Y], [Z|L1], X) :- X \= Z,
                                  retiraElemento(Y, L1, X).


insereElemento(X, [], X).
insereElemento(X, Y, [X|Y]).
