/*
Para ganhar pontos extras após tirar nota baixa na prova de Biologia, cinco alunos, se vestiram de plantas e fizeram uma apresentaçào oral sobre árvores e flores. A partir das dicas fornecidas, descubra o nome completo de cada aluno, bem como o tipo de árvore e flor que cada um falou.

(a) Érica falou sobre petunias.
(b) O(A) aluno(a) de sobrenome Borges falou sobre pinheiros
(c) Jorge Costa falou sobre carvalhos.
(d) O(A) aluno(a) que falou sobre palmeiras também falou sobre cravos.
(e) O(A) aluno(a) de sobrenome Soares falou sobre dálias.
(f) O(A) aluno(a) de sobrenome Junqueira falou sobre ipês.
(g) Alex, cujo sobrenome não é Junqueira, falou sobre rosas.
(h) Lucas não falou sobre salgueiros.

Pergunta-se: ? 
?- solucao(X).

Em Prolog o predicado select(X, L, R) seleciona o elemento X na lista L, e retira X de L formando o resto R. Ou seja, R tem todos os elementos de L, menos o elemento selecionado X. Isso pode ser usado para, dada a lista de possibilidades para cada atributo (por exemplo, nomes dos alunos), retirar uma possibilidade da lista para gerar um nome, depois usar o resto da lista para gerar os nomes para os outros alunos. Assim, dois alunos nunca serão geradas com o mesmo nome.

Gera as nome, é um wrapper par ao select passando a lista de nomes disponíveis e recebendo o resto dos nomes disponíveis na última posição:
*/
gera_nome(planta(C, _, _, _), [C], []) :- !.
gera_nome(planta(C, _, _, _), Nomes, Resto) :- select(C, Nomes, Resto).

/*
Gera os sobrenomes, é um wrapper para o select passando a lista de sobrenomes disponíveis e recebendo o resto das sobrenomes disponíveis na última posição:
*/
gera_sobrenome(planta(_, N, _, _), [N], []) :- !.
gera_sobrenome(planta(_, N, _, _), Sobrenomes, Resto) :- select(N, Sobrenomes, Resto).

/*
Gera as árvores, é um wrapper para o select passando a lista de árvores disponíveis e recebendo o resto das árvores disponíveis na última posição:
*/
gera_arvore(planta(_, _, B, _), [B], []) :- !.
gera_arvore(planta(_, _, B, _), Arvores, Resto) :- select(B, Arvores, Resto).

/*
Gera as flores, é um wrapper para o select passando a lista de flores disponíveis e recebendo o resto das flores disponíveis na última posição:
*/
gera_flor(planta(_, _, _, C), [C], []) :- !.
gera_flor(planta(_, _, _, C), Flores, Resto) :- select(C, Flores, Resto).


/*
Gera uma composicao inteira e um conjunto de alunos usando um mapeamento recursivo.
A estrutura "atr" guarda as listas com todos os atributos disponíveis, para simplificar o código.
*/
gera_planta(N, atr(Ns, Ss, As, Fs), atr(Ns2, Ss2, As2, Fs2)) :-
          gera_nome(N, Ns, Ns2), 
		  gera_sobrenome(N, Ss, Ss2),
		  gera_arvore(N, As, As2), 
		  gera_flor(N, Fs, Fs2).

gera_plantas([], _) :- !.
gera_plantas([C|Cs], Atribs) :-
        gera_planta(C, Atribs, Atribs2), gera_plantas(Cs, Atribs2).

gera_sol([C1, C2, C3, C4, C5]) :-
        Nomes = [alex,erica,jorge,lucas,patricia],
        Sobrenomes = [borges,costa,junqueira,soares,vieira],
        Arvores = [carvalho,ipe,palmeira,pinheiro,salgueiro],
        Flores = [azaleia,cravo,dalia,petunia,rosa],        
        gera_plantas([C1, C2, C3, C4, C5], atr(Nomes, Sobrenomes, Arvores, Flores)).
        
/*
Especifica das dicas
*/ 		
solucao(S):-	
	S=[C1,C2,C3,C4,C5], !,
		member(planta(erica, _, _, petunia), S),	
		member(planta(_, borges, pinheiro, _), S),		
		member(planta(jorge, costa, carvalho, _), S),
		member(planta(_, _, palmeira, cravo), S),
		member(planta(_, soares, _, dalia), S),
		member(planta(_, junqueira, ipe, _), S),
		member(planta(alex, A1, _, rosa), S), A1 \= junqueira,
		member(planta(lucas, _, _, B1), S), B1 \= salgueiro,
		gera_sol(S).
	
