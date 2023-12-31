﻿% LABORATÓRIOS

% Problema dos pais

male(albert).
male(edward).
male(bertolini).

female(alice).
female(victoria).
female(sthephanny).

parents(edward, victoria, albert).
parents(alice, victoria, albert).
parents(bertolini, sthephanny, albert).

diff(X, Y) :- X \== Y.

sister_of(X, Y) :- female(X),
			 parents(X, _, D),
    			 parents(Y, _, D),
		       diff(X, Y).
				   
				   
% Problema do Influencer

influencer(orochinho).

likes(orochinho, chocolate).
likes(arthur, orochinho).

likes_of(X, Z) :- influencer(Y),
    	          likes(X, Y),
    	          likes(Y, Z).
    			  

% Problema do reino	

reigns(arthur, 844, 878).
reigns(maria, 878, 916).
reigns(malu, 916, 950).

prince_ss(X, Y) :- reigns(X, A, B),
    		    Y >= A,
                   Y =< B.


% Regra do fatorial - OK

fatorial(0, 1).

fatorial(N, R) :- N > 0, 
                  N1 is N - 1,
                  fatorial(N1, R1),
                  R is N * R1.

% Um caso para testar: fatorial(5, X). = 120


% Regra da potência - OK

pot(_, 0, 1).

pot(N, N1, R) :- N2 is N1 - 1,
		 pot(N, N2, R1),
                 R is N * R1.
 
% Um caso para testar: pot(9, 2, X). = 81


% Conta Dígitos - OK

cdig(N, 1) :- N < 10.

cdig(N, R) :- cdig2(N, 10, 100, 2, R).

cdig2(N, A, A1, R1, R) :- A =< N, 
                          N < A1,
                          R is R1, !.

cdig2(N, _, A1, R1, R) :- N >= A1, 
                          A2 is A1,
                          A3 is A2 * 10,
                          R2 is R1 + 1,
                          cdig2(N, A2, A3, R2, R).

% Um caso para testar eh: cdig(10000000, R). = 8


% Contar ocorrência do dígito 7 - OK

conta_sete(X, R) :- X < 10,
                    X =:= 7,
                    R is 1.
conta_sete(X, R) :- X < 10,
                    X =\= 7,
                    R is 0.

conta_sete(X, R) :- X >= 10,
                    X1 is X mod 10,
                    X2 is X // 10,
                    conta_sete(X1, R1),
    		    conta_sete(X2, R2),
                    R is R1 + R2.


%Soma Dígitos - OK

sdr(N, N) :- N < 10, 
             !.

sdr(N, R) :- N >= 10,
             N1 is N mod 10,
             N2 is N // 10,
             sdr(N1, R1),
    	     sdr(N2, R2),
             N3 is R1 + R2,
    	     sdr(N3, R).


% Rotação de números - OK

cdig(Y, R) :- Y < 10, R is 1.

cdig(Y, R) :- Y >= 10, 
              Y1 is Y // 10,
    	      cdig(Y1, R1),
              R is R1 + 1.

pot(0, 1).

pot(W, Z) :- W > 0,
    	     W1 is W - 1,
             pot(W1, Z1),
             Z is Z1 * 10.    

rot(X, N) :- X < 10, N is X.

rot(X, N) :- X >= 10,
             N1 is X mod 10,
             N2 is X // 10,
             cdig(N2, R2),
             pot(R2, R3),
             N3 is N1 * R3,
             N is N3 + N2.


% Família - OK

homem(ivo).
homem(ary).
homem(gil).
homem(rai).
homem(noé).

mulher(ana).
mulher(bia).
mulher(eva).
mulher(clô).
mulher(lia).
mulher(gal).

pai(lia, gal).
pai(gil, ary).
pai(gil, rai).
pai(gil, clô).
pai(rai, noé).
pai(ivo, eva).

mae(ary, gal).
mae(bia, ary).
mae(bia, rai).
mae(eva, noé).
mae(bia, clô).
mae(ana, eva).

gerou(X, Y) :- pai(X, Y);
               mae(X, Y).

filho(X, Y, Z) :- homem(Z),
                  mae(X, Z),
    	          pai(Y, Z).
                  

filha(X, Y, Z) :- mulher(Z),
                  mae(X, Z),
    	          pai(Y, Z).

irmao(X, Y) :- homem(Y),
               X \= Y,
	       filho(P1, P2, Y),
               (filho(P1, P2, X);
               filha(P1, P2, X)).

irma(X, Y) :- mulher(Y),
              X \= Y,
	      filha(P1, P2, Y),
              (filho(P1, P2, X);
              filha(P1, P2, X)).

tio(X, Y) :- homem(Y),
             (filho(Z, W, X);
             filha(Z, W, X)),
    	     (irmao(Y, W);
             irmao(Y, Z)).

tia(X, Y) :- mulher(Y),
             (filho(Z, W, X);
             filha(Z, W, X)),
    	     (irmao(W, Y);
             irma(Z,  Y)).

avô(X, Y) :- homem(Y),
             (filho(Z, W, X);
             filha(Z, W, X)),
    	     (pai(Y, W);
             pai(Y, Z)).

avó(X, Y) :- mulher(Y),
             (filho(Z, W, X);
             filha(Z, W, X)),
    	     (mae(Y, W);
             mae(Y, Z)).






             
