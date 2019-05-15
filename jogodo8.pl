%%%%%%%%%% Identificacao do sucessor %%%%%%%%%% 

sucessor(nodo(E1,C),nodo(E2,C2)):-
        suc(E1,E2),
        C2 is C+1.

suc([[vazio,X,Y]|Resto],[[X,vazio,Y]|Resto]).
suc([[vazio|R1],[X|R2]|Resto],[[X|R1],[vazio|R2]|Resto]).

suc([[X,vazio,Y]|Resto],[[vazio,X,Y]|Resto]).
suc([[X,vazio,Y]|Resto],[[X,Y,vazio]|Resto]).
suc([[X,vazio,Y],[U,V,W]|Resto],[[X,V,Y],[U,vazio,W]|Resto]).

suc([[X,Y,vazio]|Resto],[[X,vazio,Y]|Resto]).
suc([[X,Y,vazio],[U,V,W]|Resto],[[X,Y,W],[U,V,vazio]|Resto]).

suc([L1,[vazio,X,Y],L3],[L1,[X,vazio,Y],L3]).
suc([[U,V,W],[vazio,X,Y],L3],[[vazio,V,W],[U,X,Y],L3]).
suc([L1,[vazio,X,Y],[U,V,W]],[L1,[U,X,Y],[vazio,V,W]]).

suc([L1,[X,vazio,Y],L3],[L1,[vazio,X,Y],L3]).
suc([L1,[X,vazio,Y],L3],[L1,[X,Y,vazio],L3]).
suc([[U,V,W],[X,vazio,Y],L3],[[U,vazio,W],[X,V,Y],L3]).
suc([L1,[X,vazio,Y],[U,V,W]],[L1,[X,V,Y],[U,vazio,W]]).

suc([L1,[X,Y,vazio],L3],[L1,[X,vazio,Y],L3]).
suc([[U,V,W],[X,Y,vazio],L3],[[U,V,vazio],[X,Y,W],L3]).
suc([L1,[X,Y,vazio],[U,V,W]],[L1,[X,Y,W],[U,V,vazio]]).

suc([L1,L2,[vazio,X,Y]],[L1,L2,[X,vazio,Y]]).
suc([L1,[X|R2],[vazio|R1]],[L1,[vazio|R2],[X|R1]]).

suc([L1,L2,[X,vazio,Y]],[L1,L2,[vazio,X,Y]]).
suc([L1,L2,[X,vazio,Y]],[L1,L2,[X,Y,vazio]]).
suc([L1,[U,V,W],[X,vazio,Y]],[L1,[U,vazio,W],[X,V,Y]]).


suc([L1,L2,[X,Y,vazio]],[L1,L2,[X,vazio,Y]]).
suc([L1,[U,V,W],[X,Y,vazio]],[L1,[U,V,vazio],[X,Y,W]]).



%%%%%%%%%% Heuristica H0 %%%%%%%%%%
% Nao da nenhuma avaliacao da distanca que sobra:  h(n) = 0


heuristica0([nodo(_,Val)|_],Val).
 

%%%%%%%%%% Heuristica H1 %%%%%%%%%%
% Calcula o numero de pecas que nao estao na posicao final


heuristica1([nodo(Conf,C)|_],V):-
	bem_colocados(Conf,[[1,2,3],[8,vazio,4],[7,6,5]],0,Val),
	V is C+8-Val.

bem_colocados([],_,V,V).
bem_colocados([[]|Resto],[[]|R2],Acc,Val):-
	bem_colocados(Resto,R2,Acc,Val).
bem_colocados([[X|R]|Resto],[[X|R2]|Resto2],Acc,Val):-
	X \= vazio,!,
	A2 is Acc+1,
	bem_colocados([R|Resto],[R2|Resto2],A2,Val).
bem_colocados([[_|R]|Resto],[[_|R2]|Resto2],Acc,Val):-
	bem_colocados([R|Resto],[R2|Resto2],Acc,Val).



%%%%%%%%%% Heuristica H2 %%%%%%%%%%
% Calcula a soma das distancas que separam cada peca da sua posicao
% final

heuristica2([nodo(Conf,C)|_],V):-
	calcular_dist(8,Conf,[[1,2,3],[8,vazio,4],[7,6,5]],0,D),
	V is C+D.


calcular_dist(0,_,_,D,D).
calcular_dist(X,Conf,Ref,A,D):-
	pos(X,Conf,Pos1),
	pos(X,Ref,Pos2),
	distanca(Pos1,Pos2,Dist),
	A1 is A+Dist,
	X1 is X-1,
	calcular_dist(X1,Conf,Ref,A1,D).

pos(X,[[X,_,_]|_],(0,0)).
pos(X,[[_,X,_]|_],(0,1)).
pos(X,[[_,_,X]|_],(0,2)).
pos(X,[_,[X,_,_]|_],(1,0)).
pos(X,[_,[_,X,_]|_],(1,1)).
pos(X,[_,[_,_,X]|_],(1,2)).
pos(X,[_,_,[X,_,_]],(2,0)).
pos(X,[_,_,[_,X,_]],(2,1)).
pos(X,[_,_,[_,_,X]],(2,2)).


distanca((X,Y),(U,V),D):-
	D is abs(U-X) + abs(V-Y).




%%%%%%%%%% Teste de sucesso %%%%%%%%%%


teste_sucesso(nodo([[1,2,3],[8,vazio,4],[7,6,5]],_)).