clear :- put(27), put(91), put(50), put(74).

carregar:-
	open(animais, append, S), write(S,''),close(S),
	['animais'],
	nl, write('Base de dados carregada com sucesso!'), nl, nl.

iniciar :-
	carregar, 
	clear,
	nl, nl, 
	write('--------------------------------------------------'), nl,
	write('--------------------------------------------------'), nl,
        write('                 Trabalho Final                   '), nl,
	write('--------------------------------------------------'), nl,
	write('--------------------------------------------------'), nl,
	write('  Para inserir um novo animal utilize "inserir."  '), nl,
	write('      Para buscar um animal utilize "busca."      '), nl,
	write('--------------------------------------------------'), nl,
	write('--------------------------------------------------'), nl,
	write('--------------------- Grupo ----------------------'), nl,
	write('--------------------------------------------------'), nl,
	write('----- Dayana Spagnuelo              07132015 -----'), nl,
	write('----- Glauco Neves                  07132022 -----'), nl,
	write('----- Guilherme Pacheco             07132051 -----'), nl,
	write('----- Joao Ricardo Mattos           05232228 -----'), nl,
	write('--------------------------------------------------'), nl,
	write('--------------------------------------------------'), nl,
	nl.

:-iniciar.

limparBusca :-
	retract(patas(_)),
	retract(glmamarias(_)),
	retract(pelo(_)),
	retract(nadadeiras(_)),
	retract(branquias(_)),
	retract(oviparo(_)),
	retract(asa(_)).
	

busca :- 
	procurar,
	limparBusca.

procurar :-
	perguntaNome(N), nl, procurar(N).

procurar(N) :-
	animal(N, C),
	assertClasse(C),
	imprimirClasse(N).

procurar(N) :-
	perguntaPatas, nl,
	perguntaGlMamarias, nl,
	perguntaPelo, nl,
	perguntaNadadeiras, nl,
	perguntaBranquias, nl,
	perguntaOviparo, nl,
	perguntaAsa, nl,
	verificaClasse,
	carregar,
	classe(X),
	open(animais, append, S),
	write(S, 'animal('), write(S, N), write(S, ', '), write(S, X), write(S, ').\n'),
	close(S),
	carregar,
	imprimirClasse(N).

verificaClasse :- 
	classe(_).
	

verificaClasse :- write('Esta classe nao existe, como voce quer chama-la?'), nl,
	read(X),
	open(animais, append, S),
	write(S, 'classe('), write(S, X), write(S, ') :- '),
	patas(A),
	write(S, 'patas('), write(S, A), write(S, '),'),
	glmamarias(B),
	write(S, 'glmamarias('), write(S, B), write(S, '),'),
	pelo(C),
	write(S, 'pelo('), write(S, C), write(S, '),'),
	nadadeiras(D),
	write(S, 'nadadeiras('), write(S, D), write(S, '),'),
	branquias(E),
	write(S, 'branquias('), write(S, E), write(S, '),'),
	oviparo(F),
	write(S, 'oviparo('), write(S, F), write(S, '),'),
	asa(G),
	write(S, 'asa('), write(S, G), write(S, ').\n'),
	write(S, 'assertClasse('), write(S, X), write(S, ') :- '),
	write(S, 'assert(patas('), write(S, A), write(S, ')),'),
	write(S, 'assert(glmamarias('), write(S, B), write(S, ')),'),
	write(S, 'assert(pelo('), write(S, C), write(S, ')),'),
	write(S, 'assert(nadadeiras('), write(S, D), write(S, ')),'),
	write(S, 'assert(branquias('), write(S, E), write(S, ')),'),
	write(S, 'assert(oviparo('), write(S, F), write(S, ')),'),
	write(S, 'assert(asa('), write(S, G), write(S, ')).\n'),
	close(S).

inserir :-
	write('Escreva as regras que deseja inserir na base de dados. Cada resposta deve ser seguida de um "."'), nl,
	insereClasse, nl, inserePatas, nl, insereGlMamarias, nl, inserePelo, nl, insereNadadeiras, nl, insereBranquias, nl, insereOviparo, nl, insereAsa, nl,
	write('Recarregando o arquivo...'),nl,
	carregar.


insereClasse :-
	write('Digite a Classe:'),nl,
	open(animais, append, S),
	read(P),
	write(S, 'classe('), write(S, P), write(S,') :- '),
	close(S).

inserePatas:-
	write('Os animais desta classe possuem patas?'), nl,
	write('1 sim'), nl,
	write('2 não'), nl,
	open(animais, append, S),
	read(P),
	write(S, 'patas('), write(S, P), write(S,'),'),
	close(S).

insereGlMamarias:-
	write('Os animais desta classe têm glândulas mamárias?'), nl,
	write('1 sim'), nl,
	write('2 não'), nl,
	open(animais, append, S),
	read(P),
	write(S, 'glmamarias('), write(S, P), write(S,'),'),
	close(S).

inserePelo:-
	write('Os animais desta classe possuem pelo?'), nl,
	write('1 sim'), nl,
	write('2 não'), nl,
	open(animais, append, S),
	read(P),
	write(S, 'pelo('), write(S, P), write(S,'),'),
	close(S).

insereNadadeiras:-
	write('Os animais desta classe possuem nadadeiras?'), nl,
	write('1 sim'), nl,
	write('2 não'), nl,
	open(animais, append, S),
	read(P),
	write(S, 'nadadeiras('), write(S, P), write(S,'),'),
	close(S).

insereBranquias:-
	write('Os animais desta classe possuem branquias?'), nl,
	write('1 sim'), nl,
	write('2 não'), nl,
	open(animais, append, S),
	read(P),
	write(S, 'branquias('), write(S, P), write(S,'),'),
	close(S).

insereOviparo:-
	write('Os animais desta classe são Ovíparos?'), nl,
	write('1 sim'), nl,
	write('2 não'), nl,
	open(animais, append, S),
	read(P),
	write(S, 'oviparo('), write(S, P), write(S,'),'),
	close(S).

insereAsa:-
	write('Os animais desta classe possuem asa?'), nl,
	write('1 sim'), nl,
	write('2 não'), nl,
	open(animais, append, S),
	read(P),
	write(S, 'asa('), write(S, P), write(S,').\n'),
	close(S).

perguntaNome(N):-
	write('Qual o nome do animal?'), nl,
	read(N), nl.

perguntaPatas:-
	write('O animal possui patas?'), nl,
	write('1 sim'), nl,
	write('2 não'), nl,
	read(L), nl, L > 0, L < 3,
	assert(patas(L)).

perguntaPatas:- 
	write('digite somente 1 ou 2'), nl,
	perguntaPatas.

perguntaGlMamarias:-
	write('O animal possui glândulas mamárias?'), nl,
	write('1 sim'), nl,
	write('2 não'), nl,
	read(L), nl, L > 0, L < 3, 
	assert(glmamarias(L)).

perguntaGlMamarias :-
	write('digite somente 1 ou 2'), nl,
	perguntaGlMamarias.

perguntaPelo:-
	write('O animal possui pelo?'), nl,
	write('1 sim'), nl,
	write('2 não'), nl,
	read(L), nl, L > 0, L < 3,
	assert(pelo(L)).

perguntaPelo:-
	write('digite somente 1 ou 2'), nl,
	perguntaPelo.

perguntaNadadeiras:-
	write('O animal possui nadadeiras?'), nl,
	write('1 sim'), nl,
	write('2 não'), nl,
	read(L), nl, L > 0, L < 3,
	assert(nadadeiras(L)).

perguntaNadadeiras :-
	write('digite somente 1 ou 2'), nl,
	perguntanadadeiras.

perguntaBranquias :-
	write('O animal possui brânquias?'), nl,
	write('1 sim'), nl,
	write('2 não'), nl,
	read(L), nl, L > 0, L < 3,
	assert(branquias(L)).

perguntaBranquias :-
	write('digite somente 1 ou 2'), nl,
	perguntabranquias.

perguntaOviparo :-
	write('O animal é Ovíparo?'), nl,
	write('1 sim'), nl,
	write('2 não'), nl,
	read(L), nl, L > 0, L < 3,
	assert(oviparo(L)).

perguntaOviparo :-
	write('digite somente 1 ou 2'), nl,
	perguntaOviparo.

perguntaAsa :-
	write('O animal possui asa?'), nl,
	write('1 sim'), nl,
	write('2 não'), nl,
	read(L), nl, L > 0, L < 3,
	assert(asa(L)).

perguntaAsa :-
	write('digite somente 1 ou 2'), nl,
	perguntaAsa.

imprimirClasse(N):-
	clear,
	write(N), write(' é da classe: '), nl,
	classe(X),
	write('* '), write(X), nl,
	imprimePatas,
	imprimeGlmamarias,
	imprimePelo,
	imprimeNadadeiras,
	imprimeBranquias,
	imprimeOviparo,
	imprimeAsa.

imprimePatas :- patas(1), write('possui patas;'), nl.
imprimePatas :- patas(2), write('nao possui patas;'), nl.

imprimeGlmamarias :- glmamarias(1), write('possui glandulas mamarias;'), nl.
imprimeGlmamarias :- glmamarias(2), write('nao possui glandulas mamarias;'), nl.

imprimePelo :- pelo(1), write('possui pelo'), nl.
imprimePelo :- pelo(2), write('nao possui pelo'), nl.

imprimeNadadeiras :- nadadeiras(1), write('possui nadadeiras;'), nl.
imprimeNadadeiras :- nadadeiras(2), write('nao possui nadadeiras;'), nl.

imprimeBranquias :- branquias(1), write('possui branquias;'), nl.
imprimeBranquias :- branquias(2), write('nao possui branquias;'), nl.

imprimeOviparo :- oviparo(1), write('e oviparo;'), nl.
imprimeOviparo :- oviparo(2), write('nao e oviparo;'), nl.

imprimeAsa :- asa(1), write('possui asa'), nl.
imprimeAsa :- asa(2), write('nao possui asa'), nl.