/* 
Desafio: Primeiro de Abril

Quatro pessoas que gostam de pregar pe�as decidiram tornar o primeiro de abril inesquec�vel, ou seja, com muitas brincadeiras. Cada um pregou uma pe�a numa v�tima diferente usando um objeto inofensivo.

Nomes: Ana, Ester, Pablo, Rodolfo

Sobrenomes: Fontes, Levis, Matoso, Salgado

Brincadeiras: Almofada de barulho, Aranha falsa, Foto alterada, Mosca falsa

V�timas: Irm�o, M�e, Pai, Tia

Dicas:

Ana deu risadas enquanto colocava uma aranha falsa na comida de sua v�tima. A pessoa de sobrenome Salgado (que n�o � Ana) pregou uma pe�a em seu irm�o. A pessoa de sobrenome Matoso colocou uma almofada de barulho na cadeira de sua v�tima. Rodolfo pregou uma pe�a em sua tia, mas n�o foi ele que usou a almofada de barulho. A brincadeira feita por Levis inclu�a uma mosca falsa. A v�tima de Ester foi seu pai.

p(Nome, Sobrenome, Brincadeira, Vitima) */

gera(p(N, S, B, V)) :-
        member(N, [ana, ester, pablo, rodolfo]),
        member(S, [fontes, levis, matoso, salgado]),
        member(B, [almofada, aranha, foto, mosca]),
        member(V, [irmao, mae, pai, tia]).

dif(p(N1, S1, B1, V1), p(N2, S2, B2, V2)) :-
        N1 \= N2, S1 \= S2, B1 \= B2, V1 \= V2.

todas_dif(P1, P2, P3, P4) :-
        dif(P1, P2), dif(P1, P3), dif(P1, P4),
        dif(P2, P3), dif(P2, P4), dif(P3, P4).

solucao(S) :-
        S = [P1, P2, P3, P4],
        gera(P1), gera(P2), gera(P3), gera(P4),
        todas_dif(P1, P2, P3, P4), 
        member(p(ana, _, aranha, _), S),
        member(p(N, salgado, _, irmao), S), N \= ana,
        member(p(_, matoso, almofada, _), S),
        member(p(rodolfo, _, B, tia), S), B \= almofada,
        member(p(_, levis, mosca, _), S),
        member(p(ester, _, _, pai), S).

gera_ef(P1, P2, P3, P4) :-
        P1 = p(ana, _, _, _),
        P2 = p(ester, _, _, _),
        P3 = p(pablo, _, _, _),
        P4 = p(rodolfo, _, _, _),
        gera(P1), gera(P2), gera(P3), gera(P4),
        todas_dif(P1, P2, P3, P4).

solucao2(S) :-
        S = [P1, P2, P3, P4],
        gera_ef(P1, P2, P3, P4),
        member(p(ana, _, aranha, _), S),
        member(p(N, salgado, _, irmao), S), N \= ana,
        member(p(_, matoso, almofada, _), S),
        member(p(rodolfo, _, B, tia), S), B \= almofada,
        member(p(_, levis, mosca, _), S),
        member(p(ester, _, _, pai), S),
        !.