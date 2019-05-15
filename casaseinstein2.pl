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


* Pergunta-se: quem cria peixes? 
* solucao(X,Y).

* Regras para determinar se X est� ao lado de Y 
* X � direita de Y 
*/
ao_lado(X, Y, Lista) :- a_direita(X, Y, Lista). 

/* Y � direita de X */

ao_lado(X, Y, Lista) :- a_direita(Y, X, Lista). 
/* 
Regra para determinar se uma casa est� � direita da outra. 
   Opera��o [X | Y]: separa uma lista, sendo que 
   X designa o primeiro elemento e Y o restante da lista.
   (semelhante a CAR CDR em Scheme) 
   
   Condi��o para fim da recurs�o:
   X est� � direita de Y se Y est� na primeira posi��o e X est� na segunda.
*/

a_direita(X, Y, [Y | [X | _]]).

/* Condi��o recursiva:
 X est� � direita de Y se estiver � direita de Y no Restante da lista.*/
a_direita(X, Y, [_ | Restante]) :- a_direita(X, Y, Restante).

/* A solu��o � uma lista de casas, sendo que cada casa tem a forma:
  casa(cor, nacionalidade, animal, bebida, cigarro)
  member(E, Lista): verdadeiro se E � um dos elementos de Lista
  O operador "=" unifica o lado esquerdo com o direito */

solucao(Casas, Dono_Peixe) :-
  Casas = [_, _, _, _, _], /* lista com 5 elementos*/
  member(casa(vermelha, ingles, _, _, _), Casas),
  member(casa(_, sueco, cachorro, _, _), Casas),
  member(casa(_, dinamarques, _, cha, _), Casas),
  a_direita(casa(verde,_,_,_,_), casa(branca,_,_,_,_), Casas),
  member(casa(verde, _, _, cafe, _), Casas),
  member(casa(_, _, passaro, _, pallmall), Casas),
  member(casa(amarela, _, _, _, hollywood), Casas),
  [_, _, casa(_, _, _, leite, _), _, _] = Casas,
  [casa(_, noruegues, _, _, _) | _] = Casas,
  ao_lado(casa(_, _, _, _, charme), casa(_, _, gato, _, _), Casas),
  ao_lado(casa(_, _, _, _, hollywood), casa(_, _, cavalo, _, _), Casas),
  member(casa(_, _, _, cerveja, free), Casas),
  member(casa(_, alemao, _, _, camel), Casas),
  ao_lado(casa(_, noruegues, _, _, _), casa(azul, _, _, _, _), Casas),
  ao_lado(casa(_, _, _, _, charme), casa(_, _, _, agua, _), Casas),
  member(casa(_, Dono_Peixe, peixe, _, _), Casas).

  
