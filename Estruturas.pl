% Estruturas - OK

hist(data(22, abril, 1500), 'Descobrimento do Brasil').
hist(data(7, setembro, 1822), 'Declaração da Independência').
hist(data(15, novembro, 1888), 'Proclamação da República').


estrada(1, a, b).
estrada(2, a, d).
estrada(3, b, c).
estrada(4, c, d).
estrada(5, b, e).
estrada(6, c, f).
estrada(7, d, f).
estrada(8, e, f).

rota(A, B, R) :- estrada(R, A, B).  

rotaC(R, A) :- estrada(R, _, A).

rotaD(R, A) :- estrada(R, A, _).


livro(nome('Percy Jackson'), autor('Bruno'), pal_chave([fantasia, mitologia, ficção])). 
livro(nome('Males da Mente'), autor('Bruno'), pal_chave([terror, investigação, ficção])). 
livro(nome('A Culpa é das Estrelas'), autor('Jonh'), pal_chave([drama, romance, ficção])). 
livro(nome('Senhor dos Áneis'), autor('Tolkien'), pal_chave([fantasia, medieval, aventura])). 
livro(nome('A Garota do Lago'), autor('Arthur'), pal_chave([misterio, investigação, drama])). 
livro(nome('The Witcher'), autor('Alemao'), pal_chave([fantasia, medieval, aventura])). 
livro(nome('C++'), autor('Claudiney'), pal_chave([linguagemc, programação, computação])). 
livro(nome('Prolog'), autor('Renato'), pal_chave([lógica, programação, computação])). 
livro(nome('Lógica'), autor('João Nunes'), pal_chave([lógica, programação, computação])). 
livro(nome('Fred por Fred'), autor('Fred'), pal_chave([fred, scooby-doo, misterio])). 

presente(D, pal_chave(C)) :- member(D, C).

pesquisa(DL, Livro, Autor) :- livro(Livro, Autor, pal_chave(PL)),
    	                      member(D, C),
                              presente(D, pal_chave(PL)).


dono(jose, carro(onix, azul-marinho, hatch)).
dono(maria, carro(compass, cinza, suv)).
dono(joão, carro(uno, verde-musgo, monstruosidade)).
dono(leopolda, carro(corolla, branco, sedã)).
dono(jacinto, carro(i8, preto, esport)).
dono(bertolini, carro(monza, prata, sedã)).
dono(odelmo, carro(gol, branco, hatch)).
dono(fer, carro(cruze, prata, sedã)).
dono(arthur, carro(civic, chumbo, coupé)).
dono(sthe, carro(ka, vermelho, hatch)).


d(0, zero).
d(1, um).
d(2, dois).
d(3, três).
d(4, quatro).
d(5, cinco).
d(6, seis).
d(7, sete).
d(8, oito).
d(9, nove).

txt([], []).
txt([D|P], [A|B]) :- d(D, A), txt(P, B).
