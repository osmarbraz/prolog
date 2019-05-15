/* Metodo da Insercao Ordenada 
O Um elemento (tipicamente o primeiro) ´e removido da lista
O resto da lista ´e ordenada recursivamente
O elemento removido ´e inserido de uma forma ordenada
*/
insert(X,[],[X]).
insert(X,[Y|Ys],[Y|Zs]) :- X > Y, !, insert(X,Ys,Zs).
insert(X,[Y|Ys],[X,Y|Ys]) :- X =< Y.

insertion-sort([X|Xs],Ys) :- insertion-sort(Xs,Zs), !, insert(X,Zs,Ys).
insertion-sort([],[]).