/* 01 =====================

* Predicado: primeiro(L,P)
* Defini��o: L � uma lista e P � o primeiro dado de L. */
primeiro(P,[P|_]).


/* 02 ====================
* Predicado: segundo(L,S)
* Defini��o: L � uma lista e S � o segundo dado de L.*/
segundo(S,[_|Y]):- primeiro(S,Y).


/* 03 ===================
* Predicado: ultimo(L,U)
* Defini��o: L � uma lista e U � o �ltimo dado de L.*/
ultimo(U,[U|[]]).
ultimo(U,[_|Y]):- ultimo(U,Y).


/* 04 ======================
* Predicado: penultimo(L,P)
* Defini��o: L � uma lista e P � o pen�ltimo de L.*/
penultimo([P,_], P).
penultimo([_,S,T|R],P) :- penultimo([S,T|R],P).


/* 05 ====================
* Predicado: tamanho(L,T)
* Defini��o: L � uma lista e T � o n�mero de dados de L.*/
tamanho([], 0).
tamanho([_|Y], N) :- tamanho(Y, N1), N is N1+1.


/* 06 =====================
* Predicado: pertence(D,L)
* Defini��o: L � uma lista e D � um dos dados de L.*/
pertence(D, [D|_]).
pertence(D, [_|Y]) :- pertence(D, Y).


/* 07 ========================
* Predicado: posicao(D,L,Pos)
* Defini��o: L � uma lista e Pos � a posi��o (iniciando com 1) 
* do dado D na lista L. Pos = 0 caso dado n�o esteja em L.*/
posicao(D,[],0).
posicao(D,[P|_],1) :- D = P.
posicao(D,[P|T],Pos) :- D \= P, posicao(D,T,PosAuxiliar),Pos is PosAuxiliar + 1.


/* 08 ==============================
* Predicado: removidoPrimeiro(L,LR)
* Defini��o: L � uma lista e LR � uma lista com os mesmos dados de L, menos o primeiro.*/
removidoPrimeiro([X|Y],Y).


/* 09 ============================
* Predicado: removidoUltimo(L,LR)
* Defini��o: L � uma lista e LR � uma lista com os mesmos dados de L, menos o �ltimo.Primeira parte:*/
removidoUltimo([X],[]).
removidoUltimo([Y|T], [Y|T2]) :- removidoUltimo(T,T2).


/* 10 =================================
* Predicado: substituidoUltimo(D,L,LM)
* Defini��o: L � uma lista e LM � uma lista com os mesmos dados de L, com exce��o do �ltimo que � D.*/
substituidoUltimo(D,[U],[D]).
substituidoUltimo(D,[A|T], [A|T2]) :- substituidoUltimo(D,T,T2).


/* 11 ==================================
* Predicado: inseridoNoInicio(D, L, LM)
* Defini��o: D � um dado, L � uma lista e LM � a lista L mais o dado D no in�cio. */
inseridoNoInicio(D, L, [D|L]):- !.


/* 12 =================================
* Predicado: inseridoNoFinal(D, L, LM)
* Defini��o: D � um dado, L � uma lista e LM � a lista L mais o dado D no final.*/
inseridoNoFinal(D,[],[D]).
inseridoNoFinal(D,[A|T],[A|T2]) :- inseridoNoFinal(D,T,T2).


/* 13 ====================================
* Predicado: inseridoNaPos(D, Pos, L, LM)
* Defini��o: D � um dado, Pos � a posi��o onde D deve ser inserido na lista L e LM � a lista L mais o dado D na posi��o Pos.*/
inseridoNaPos(D,1, L,[D|L]).
inseridoNaPos(D,Pos,[A|T],[A|T2]) :- inseridoNaPos(D,PosAuxiliar,T,T2),
Pos is PosAuxiliar + 1.


/* 14 =====================================
* Predicado: removidoDaPos(L, Pos, D, LM)
* Defini��o: L � uma lista, Pos � a posi��o do dado a ser removido, D � o dado removido e LM � a lista L sem o dado removido.*/
removidoDaPos(P,1,[P|Y],Y). 
removidoDaPos(D,Pos,[P|T],[P|T2]) :- Pos > 1, removidoDaPos(D,PosAuxiliar,T,T2), Pos is PosAuxiliar + 1.


/* 15 =====================================
* Predicado: substituidoDoInicio(D, L, LM)
* Defini��o: D � um dado, L � uma lista e LM � a lista L com D no lugar do primeiro dado de L. */
substituidoDoInicio(D,[P|T],[D|T]).


/* 16 ====================================
* Predicado: substituidoDoFinal(D, L, LM)
* Defini��o: D � um dado, L � uma lista e LM � a lista L com D no lugar do �ltimo dado de L. */
substituidoDoFinal(D,[U],[D]).
substituidoDoFinal(D,[A|T], [A|T2]) :- substituidoDoFinal(D,T,T2).


/* 17=======================================
* Predicado: substituidoDaPos(D, Pos, L, LM)
* Defini��o: D � um dado, Pos � a posi��o do dado a ser substitu�do, L � uma lista e LM � a lista L com D no lugar do dado de L que est� na posi��o Pos.*/
substituidoDaPos(D,1,[P|T],[D|T]).
substituidoDaPos(D,Pos,[P|T],[P|T2]) :- D \= P, substituidoDaPos(D,PosAuxiliar,T,T2), Pos is PosAuxiliar + 1.

 

/* 19 ========================
* Predicado: invertida(L, LM)
* Defini��o: L � uma lista e LM � a lista L com os dados 
* invertidos (o primeriro de L ser� o �ltimo de LM, 
* o segundo de L ser� o pen�ltimo de LM e assim por diante).*/
invertida(L, LM) :- aux([], L, LM).
aux(L1, [], L1).
aux(L1, [L|LM], Z) :- aux([L | L1], LM, Z).


/* 20 ========================
* Predicado: primos(L, N)
* Defini��o: L � uma vari�vel que retorna uma lista e N � um inteiro. A lista L retorna os n�meros primos menores que N */
e_primo(2).
e_primo(3).
e_primo(P) :- integer(P), P > 3, P mod 2 =\= 0, \+fator(P,3).
fator(N,L) :- N mod L =:= 0.
fator(N,L) :- L * L < N, L2 is L + 2, fator(N,L2).