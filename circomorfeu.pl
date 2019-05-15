/*
O Circo de Morfeu
A família Morfeu trabalh em circo há gerações. Atualmente, os membros jovens da família se apresentam regularmente. Cada umd eles desempenha um trabalho artístico diferente ans apresentações. O público do circo já até sabe: quando cada artista entra em cena, acendem-se luzes de uma cor diferente para cada um. Cada artista da família Morfeu costuma entrar em cena acompanhado de um animal. A partir das informações a seguir, descubra o nome de cada artista, o número que apresenta, o animal que leva para o picadeiro e a cor das luzes que se acendem quando cada um deles entra em cena.

(1) O mágico tem um coelho branco que participa do seu número.
(2) Célio entra em cena com uma dupla de cachorrinhos poodle.
(3) As luzes azuis se acendem quando uma artista entra no picadeiro montada em seu pônei.
(4) Fabiana se apresenta quando as luzes verdes se acendem.
(5) Eurico é o engolidor de fogo. No seu número, um gato participa pulando argolas de fogo.
(6) As luzes brancas acompanham a entrada do palhaço.
(7) Angélica é malabarista.
(8) Luzes violeta se acendem na apresentação de Diogo, que não é trapezista.
(9) Um macaco acompanha acompanha o trapezista.
(10)Um artista e seu gato entram em cena no cenário de luzes vermelhas.

Pergunta-se: ? 
?- solucao(X).

Em Prolog o predicado select(X, L, R) seleciona o elemento X na lista L, e retira X de L formando o resto R. Ou seja, R tem todos os elementos de L, menos o elemento selecionado X. Isso pode ser usado para, dada a lista de possibilidades para cada atributo (por exemplo, nomes dos funcionários), retirar uma possibilidade da lista para gerar um número, depois usar o resto da lista para gerar os números para os outros artistas. Assim, números artisticos nunca serão geradas com o mesmo nome.

Gera os numeros, é um wrapper par ao select passando a lista de numeros disponíveis e recebendo o resto dos numeros disponíveis na última posição:
*/
gera_numero(circo(C, _, _, _), [C], []) :- !.
gera_numero(circo(C, _, _, _), Numeros, Resto) :- select(C, Numeros, Resto).

/*
Gera os animais, é um wrapper para o select passando a lista de animais disponíveis e recebendo o resto dos animais disponíveis na última posição:
*/
gera_animal(circo(_, N, _, _), [N], []) :- !.
gera_animal(circo(_, N, _, _), Animais, Resto) :- select(N, Animais, Resto).

/*
Gera as luzes, é um wrapper para o select passando a lista de luzes disponíveis e recebendo o resto das luzes disponíveis na última posição:
*/
gera_luz(circo(_, _, B, _), [B], []) :- !.
gera_luz(circo(_, _, B, _), Luzes, Resto) :- select(B, Luzes, Resto).

/*
Gera os artistas, é um wrapper para o select passando a lista de artistas disponíveis e recebendo o resto das artistas disponíveis na última posição:
*/
gera_artista(circo(_, _, _, C), [C], []) :- !.
gera_artista(circo(_, _, _, C), Artistas, Resto) :- select(C, Artistas, Resto).


/*
Gera uma composicao inteira e um conjunto de números usando um mapeamento recursivo.
A estrutura "atr" guarda as listas com todos os atributos disponíveis, para simplificar o código.
*/
gera_meio(N, atr(Ns, As, Ls, Ars), atr(Ns2, As2, Ls2, Ars2)) :-
          gera_numero(N, Ns, Ns2), 
		  gera_animal(N, As, As2),
		  gera_luz(N, Ls, Ls2), 
		  gera_artista(N, Ars, Ars2).

gera_meios([], _) :- !.
gera_meios([C|Cs], Atribs) :- gera_meio(C, Atribs, Atribs2), gera_meios(Cs, Atribs2).

gera_sol([C1, C2, C3, C4, C5]) :-
        Numeros  = [engolidorfogo,magico,malabarista,palhaco,trapezista],
        Animais  = [cachorro,coelho,gato,macaco,ponei],
        Luzes    = [azul,branca,verde,vermelha,violeta],
        Artistas = [angelica,celio,diogo,eurico,fabiana],        
        gera_meios([C1, C2, C3, C4, C5], atr(Numeros, Animais, Luzes, Artistas)).
        
/*
Especificacao das dicas 	
*/ 		
solucao(S):-	
	S=[C1, C2, C3, C4, C5], !,
		member(circo(       magico,     coelho,       _,        _), S),	
		member(circo(            _,   cachorro,       _,    celio), S), 
		member(circo(            _,      ponei,     azul,       _), S), 
		member(circo(            _,          _,    verde, fabiana), S), 		
		member(circo(engolidorfogo,       gato,        _,  eurico), S), 		
		member(circo(      palhaco,          _,   branca,       _), S), 		
		member(circo(  malabarista,          _,        _,angelica), S), 	
		member(circo(           A1,          _,  violeta,   diogo), S), A1 \= trapezista,	
		member(circo(   trapezista,     macaco,        _,       _), S), 	
		member(circo(            _,       gato, vermelha,      A2), S), A2 \= angelica,	A2 \= fabiana,
		gera_sol(S).
	

	