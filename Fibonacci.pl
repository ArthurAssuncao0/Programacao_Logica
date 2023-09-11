% Fibonacci - OK

par(X) :- X mod 2 =:= 0.
impar(X) :- X mod 2 =\= 0.

fib(0, 1) :- !.
fib(1, 1) :- !.
fib(2, 1) :- !.

fib(N, FN) :- N1 is N - 1,
              N2 is N - 2,
              fib(N1, FN1),
              fib(N2, FN2),
              FN is FN1 + FN2.

fib(N, FN) :- par(N),
              N2 is N // 2,
              N1 is N2 + 1,
              fib(N2, FN2),
              fib(N1, FN1),
              FN is (2 * FN1 * FN2) - (FN1 * FN1).
      
fib(N, FN) :- impar(N),
              N2 is N // 2, 
              N1 is N2 - 1,
              fib(N2, FN2),
              fib(N1, FN1),
              FN is FN1 * FN1 + FN2 * FN2.
