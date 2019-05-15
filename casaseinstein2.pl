/* 
Teste de Einstein: Considerando as sentenças a seguir, modele o conhecimento em lógica, aplique o método da resolução e responda "quem tem um peixe como animal de estimação?"(Se quiser, use o Prolog)

(a) Há 5 casas de diferentes cores;
(b) Em cada casa mora uma pessoa de nacionalidade diferente;
(c) Nenhuma delas tem o mesmo animal, fuma o mesmo cigarro ou bebe
a mesma bebida;
(d) O inglês vive na casa vermelha;
(e) O sueco tem cachorros;
(f) O dinamarquês bebe chá;
(g) A casa verde fica do lado esquerdo da casa branca;
(h) O homem que vive na casa verde bebe café;
(i) O homem que fuma Malboro cria pássaros; 
(j) O homem que vive na casa amarela fuma Hollywood; 
(k) O homem que vive na casa do meio bebe leite;
(l) O norueguês vive na primeira casa;
(m) O homem que fuma Charme vive ao lado do que tem gatos; 
(n) O homem que cria cavalos vive ao lado do que fuma Hollywood; 
(o) O homem que fuma Free bebe cerveja; 
(p) O alemão fuma Camel; 
(q) O norueguês vive ao lado da casa azul;
(r) O homem que fuma Charme é vizinho do que bebe água 


* Pergunta-se: quem cria peixes? 
* solucao(X,Y).

* Regras para determinar se X está ao lado de Y 
* X à direita de Y 
*/
ao_lado(X, Y, Lista) :- a_direita(X, Y, Lista). 

/* Y à direita de X */

ao_lado(X, Y, Lista) :- a_direita(Y, X, Lista). 
/* 
Regra para determinar se uma casa está à direita da outra. 
   Operação [X | Y]: separa uma lista, sendo que 
   X designa o primeiro elemento e Y o restante da lista.
   (semelhante a CAR CDR em Scheme) 
   
   Condição para fim da recursão:
   X está à direita de Y se Y está na primeira posição e X está na segunda.
*/

a_direita(X, Y, [Y | [X | _]]).

/* Condição recursiva:
 X está à direita de Y se estiver à direita de Y no Restante da lista.*/
a_direita(X, Y, [_ | Restante]) :- a_direita(X, Y, Restante).

/* A solução é uma lista de casas, sendo que cada casa tem a forma:
  casa(cor, nacionalidade, animal, bebida, cigarro)
  member(E, Lista): verdadeiro se E é um dos elementos de Lista
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

  
