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

Em Prolog o predicado select(X, L, R) seleciona o elemento X na lista L, e retira X de L formando o resto R. Ou seja, R tem todos os elementos de L, menos o elemento selecionado X. Isso pode ser usado para, dada a lista de possibilidades para cada atributo (por exemplo, nomes dos funcionários), retirar uma possibilidade da lista para gerar um nome, depois usar o resto da lista para gerar os nomes para os outros funcionários. Assim, dois funcionários nunca serão geradas com o mesmo nome.

Gera as funcionario, é um wrapper par ao select passando a lista de funcionario disponíveis e recebendo o resto dos funcionario disponíveis na última posição:
*/
gera_funcionario(caos(C, _, _, _), [C], []) :- !.
gera_funcionario(caos(C, _, _, _), Funcionarios, Resto) :- select(C, Funcionarios, Resto).

/*
Gera os meios de locomocao, é um wrapper para o select passando a lista de meios de locomocao disponíveis e recebendo o resto dos meios de locomocao disponíveis na última posição:
*/
gera_meiolocomocao(caos(_, N, _, _), [N], []) :- !.
gera_meiolocomocao(caos(_, N, _, _), Meios, Resto) :- select(N, Meios, Resto).

/*
Gera as distancias, é um wrapper para o select passando a lista de distancias disponíveis e recebendo o resto das distancias disponíveis na última posição:
*/
gera_distancia(caos(_, _, B, _), [B], []) :- !.
gera_distancia(caos(_, _, B, _), Distancias, Resto) :- select(B, Distancias, Resto).

/*
Gera as idades, é um wrapper para o select passando a lista de idades disponíveis e recebendo o resto das idades disponíveis na última posição:
*/
gera_idade(caos(_, _, _, C), [C], []) :- !.
gera_idade(caos(_, _, _, C), Idades, Resto) :- select(C, Idades, Resto).


/*
Gera uma composicao inteira e um conjunto de alunos usando um mapeamento recursivo.
A estrutura "atr" guarda as listas com todos os atributos disponíveis, para simplificar o código.
*/
gera_meio(N, atr(Ns, Ss, As, Fs), atr(Ns2, Ss2, As2, Fs2)) :-
          gera_funcionario(N, Ns, Ns2), 
		  gera_meiolocomocao(N, Ss, Ss2),
		  gera_distancia(N, As, As2), 
		  gera_idade(N, Fs, Fs2).

gera_meios([], _) :- !.
gera_meios([C|Cs], Atribs) :-
        gera_meio(C, Atribs, Atribs2), gera_meios(Cs, Atribs2).

gera_sol([C1, C2, C3, C4, C5]) :-
        Funcionarios = [antonio,gilda,jaqueline,juliano,vicente],
        Idades = [24,31,35,40,59],
        Meios = [ape,carona,patins,moto,bicicleta],
        Distancias = [9,10,12,13,15],        
        gera_plantas([C1, C2, C3, C4, C5], atr(Funcionarios, Idades, Meios, Distancias)).
        
/*
Especificacao das dicas
*/ 		
solucao(S):-	
	S=[C1,C2,C3,C4,C5], !,
		member(caos(_, _,bicicleta, 12), S),	
		member(caos(_, A1, moto, _), S), A1 \= 31, A1 \= 40,
		member(caos(juliano, _, A2, A3), S), A3 >
		member(caos(antonio, _, _, A4), S), A4 \= 9,
		member(caos(antonio, _, _, dalia), S),
		
		gera_sol(S).
	
