/*
Realiza a permutacao de elementos.
Perguntar:
?- perm([1,2,3],X).
X = [1, 2, 3] ;
X = [1, 3, 2] ;
X = [2, 1, 3] ;
X = [2, 3, 1] ;
X = [3, 1, 2] ;
X = [3, 2, 1] ;
false.
?- 

*/
perm([],[]).
perm(Lista,[Inicio|Fim]) :- remove(Inicio,Lista,Res),perm(Res,Fim).

remove(Inicio,[Inicio|Fim],Fim).
remove(X,[Inicio|Fim1],[Inicio|Fim2]) :- remove(X,Fim1,Fim2).