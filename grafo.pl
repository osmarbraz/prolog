/* 
Vamos perguntar qual o caminho entre 1 e 5:
caminho(1,5,W).

*/

ligacao(1,2).
ligacao(1,4).
ligacao(1,3).
ligacao(2,3).
ligacao(2,5).
ligacao(3,4).
ligacao(3,5).
ligacao(4,5).

conectado(X,Y) :- ligacao(X,Y) ; ligacao(Y,X).

caminho(A,B,Caminho) :-
       viajar(A,B,[A],Q),
       reverse(Q,Caminho).

viajar(A,B,P,[B|P]) :-
       conectado(A,B).
	   
viajar(A,B,Visitado,Caminho) :-
       conectado(A,C),
       C \== B,
       \+member(C,Visitado),
       viajar(C,B,[C|Visitado],Caminho).

