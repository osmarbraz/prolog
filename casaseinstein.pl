/* 
Teste de Einstein: Considerando as senten�as a seguir, modele o conhecimento em l�gica, aplique o m�todo da resolu��o e responda "quem tem um peixe como animal de estima��o?"(Se quiser, use o Prolog)

(a) H� 5 casas de diferentes cores;
(b) Em cada casa mora uma pessoa de nacionalidade diferente;
(c) Nenhuma delas tem o mesmo animal, fuma o mesmo cigarro ou bebe
a mesma bebida;
(d) O ingl�s vive na casa vermelha;
(e) O sueco tem cachorros;
(f) O dinamarqu�s bebe ch�;
(g) A casa verde fica do lado esquerdo da casa branca;
(h) O homem que vive na casa verde bebe caf�;
(i) O homem que fuma Malboro cria p�ssaros; 
(j) O homem que vive na casa amarela fuma Hollywood; 
(k) O homem que vive na casa do meio bebe leite;
(l) O noruegu�s vive na primeira casa;
(m) O homem que fuma Charme vive ao lado do que tem gatos; 
(n) O homem que cria cavalos vive ao lado do que fuma Hollywood; 
(o) O homem que fuma Free bebe cerveja; 
(p) O alem�o fuma Camel; 
(q) O noruegu�s vive ao lado da casa azul;
(r) O homem que fuma Charme � vizinho do que bebe �gua 

Pergunta-se: ? 
?- solucao(X).

Em Prolog o predicado select(X, L, R) seleciona o elemento X na lista L, e retira X de L formando o resto R. Ou seja, R tem todos os elementos de L, menos o elemento selecionado X. Isso pode ser usado para, dada a lista de possibilidades para cada atributo (por exemplo, cores de casa), retirar uma possibilidade da lista para gerar uma casa, depois usar o resto da lista para gerar as cores para as outras casas. Assim, duas casas nunca ser�o geradas com a mesma cor.

Gera as cores, � um wrapper par ao select passando a lista de cores dispon�veis e recebendo o resto das cores dispon�veis na �ltima posi��o:
*/

gera_cor(casa(C, _, _, _, _), [C], []) :- !.
gera_cor(casa(C, _, _, _, _), Cores, Resto) :- select(C, Cores, Resto).

/*
Gera as nacionalidades, � um wrapper para o select passando a lista de nacionalidades dispon�veis e recebendo o resto das nacionalidades dispon�veis na �ltima posi��o:
*/
gera_nacionalidade(casa(_, N, _, _, _), [N], []) :- !.
gera_nacionalidade(casa(_, N, _, _, _), Nacionalidades, Resto) :- select(N, Nacionalidades, Resto).

/*
Gera as bebidas, � um wrapper para o select passando a lista de bebidas dispon�veis e recebendo o resto das bebidas dispon�veis na �ltima posi��o:
*/
gera_bebida(casa(_, _, B, _, _), [B], []) :- !.
gera_bebida(casa(_, _, B, _, _), Bebidas, Resto) :- select(B, Bebidas, Resto).

/*
Gera os cigarros, � um wrapper para o select passando a lista de cigarros dispon�veis e recebendo o resto dos cigarros dispon�veis na �ltima posi��o:
*/
gera_cigarro(casa(_, _, _, C, _), [C], []) :- !.
gera_cigarro(casa(_, _, _, C, _), Cigarros, Resto) :- select(C, Cigarros, Resto).

/*
Gera os animais, � um wrapper para o select passando a lista de animais dispon�veis e recebendo o resto dos animais dispon�veis na �ltima posi��o:
*/
gera_animal(casa(_, _, _, _, A), [A], []) :- !.
gera_animal(casa(_, _, _, _, A), Animais, Resto) :- select(A, Animais, Resto).

/*
Gera uma casa inteira e um conjunto de casas usando um mapeamento recursivo.
A estrutura "atr" guarda as listas com todos os atributos dispon�veis, para simplificar o c�digo.
*/
gera_casa(C, atr(Cs, Ns, Bs, Cigarros, As), atr(Cs2, Ns2, Bs2, Cigarros2, As2)) :-
        gera_cor(C, Cs, Cs2), 
		gera_nacionalidade(C, Ns, Ns2),
        gera_bebida(C, Bs, Bs2), 
		gera_cigarro(C, Cigarros, Cigarros2),
		gera_animal(C, As, As2).

gera_casas([], _) :- !.
gera_casas([C|Cs], Atribs) :-
        gera_casa(C, Atribs, Atribs2), gera_casas(Cs, Atribs2).

gera_solucao([C1, C2, C3, C4, C5]) :-
        Cores = [amarela,azul,branca,verde,vermelha],
        Nacionalidades = [alemao,dinamarques,ingles,noruegues,sueco],
        Bebidas = [agua,cafe,cerveja,cha,leite],
        Cigarros = [charme,free,hollywood,malboro,camel],
        Animais = [cachorro,cavalo,gato,passaro,peixe],
        gera_casas([C1, C2, C3, C4, C5], atr(Cores, Nacionalidades, Bebidas, Cigarros, Animais)).

/*
Para resolver o teste de Einstein � preciso estabelecer quando dois moradores s�o vizinhos, como � mencionado em v�rias dicas. Considerando a lista de solu��es S, como gerada pelo predicado gera_solucao, acima, podemos criar predicados simples que testam (ou geram) moradores vizinhos na solu��o, inclusive separando vizinhos esquerdos de vizinhos direitos, pois uma dica especifica o lado.
*/
vizinho_esq(C1, C2, [C1,C2|_]).
vizinho_esq(C1, C2, [C3|T]) :- vizinho_esq(C1, C2, T).

vizinho_dir(C1, C2, [C2,C1|_]).
vizinho_dir(C1, C2, [C3|T]) :- vizinho_dir(C1, C2, T).

vizinho(C1, C2, S) :- vizinho_esq(C1, C2, S).
vizinho(C1, C2, S) :- vizinho_dir(C1, C2, S).
 
/*
Especifica das dicas
*/ 
solucao(S):-
	C1=casa(_,noruegues,_,_,_),
	C3=casa(_,_,leite,_,_),
	S=[C1,C2,C3,C4,C5], !,
        vizinho_esq(casa(verde,_,_,_,_),casa(branca,_,_,_,_), S),
        vizinho(casa(_,noruegues,_,_,_), casa(azul,_,_,_,_), S),
        vizinho(casa(_,_,_,charme,_),casa(_,_,_,_,gato), S),
        vizinho(casa(_,_,_,_,cavalo),casa(_,_,_,hollywood,_), S),
        vizinho(casa(_,_,_,charme,_),casa(_,_,agua,_,_), S),
	member(casa(vermelha,ingles,_,_,_), S),
	member(casa(_,sueco,_,_,cachorro), S),
	member(casa(_,dinamarques,cha,_,_), S),
	member(casa(verde,_,cafe,_,_), S),
	member(casa(_, _, _, malboro, passaro), S),
	member(casa(amarela,_,_,hollywood,_), S),
	member(casa(_,_,cerveja,free,_), S),
	member(casa(_,alemao,_,camel,_), S),
    gera_solucao(S).