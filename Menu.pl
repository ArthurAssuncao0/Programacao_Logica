% Problema do Menu - OK

entrada(alface, 10).
entrada(tomate, 12).
entrada(legumes, 17).
entrada(rucula, 15).

principal(pf, 75).
principal(lasanha, 99).
principal(feijoada, 120).
principal(macarrao, 83).

sobremesa(gelatina, 22).
sobremesa(sorvete, 33).
sobremesa(pudim, 15).
sobremesa(sem, 0).

tipo(diet).
tipo(normal).
tipo(glutao).

% menu(T, S, P, E) :- tipo(T),
                    % sobremesa(S, _),
                    % principal(P, _),
                    % entrada(E, _).

menu(diet, S, P, E) :- sobremesa(S, X),
                       principal(P, Y),
                       entrada(E, Z),
		       X + Y + Z < 130.

menu(glutao, S, P, E) :- sobremesa(S, X),
                         principal(P, Y),
                         entrada(E, Z),
			 X + Y + Z > 145.

menu(normal, S, P, E) :- sobremesa(S, X),
                         principal(P, _),
                         entrada(E, _),
    			 X > 0.
