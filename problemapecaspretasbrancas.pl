%%%%%%%% Identificacao do sucessor %%%%%%%%%% 

sucessor(nodo(E1,C),nodo(E2,C2)):-
        suc(E1,[],S1,Custo),
        reverse(S1,E2),
        C2 is C+Custo.


suc([],S,S,_).
suc([vazio,X|Resto],Acc,Sol,1):-
        suc(Resto,[vazio,X|Acc],Sol,1).
suc([vazio|Resto],[X|Acc],Sol,1):-
        suc(Resto,[X,vazio|Acc],Sol,1).
suc([vazio,X,Y|Resto],Acc,Sol,1):-
        suc(Resto,[vazio,X,Y|Acc],Sol,1).
suc([vazio|Resto],[X,Y|Acc],Sol,1):-
        suc(Resto,[Y,X,vazio|Acc],Sol,1).
suc([vazio,X,Y,Z|Resto],Acc,Sol,2):-
        suc(Resto,[vazio,Y,X,Z|Acc],Sol,2).
suc([vazio|Resto],[X,Y,Z|Acc],Sol,2):-
        suc(Resto,[Z,X,Y,vazio|Acc],Sol,2).
suc([X|Resto],Acc,Sol,C):-
        X \= vazio,
        suc(Resto,[X|Acc],Sol,C).



%%%%%%%%%  FUNCOES HEURISTICAS  %%%%%%%%%%%%%%%


% h0(n) = 0

heuristica0([nodo(_,Val)|_],Val).


% h1(n) = numero de pecas mal colocadas

heuristica1([nodo(Conf,Custo)|_],Val):-
	pecas_mal_coloc(Conf,1,0,N),
	Val is Custo+N.

pecas_mal_coloc([],_,N,N).
pecas_mal_coloc([b|Resto],Pos,Acc,N):-
	Pos > 3,!,
	Acc2 is Acc+1,
	Pos2 is Pos+1,
	pecas_mal_coloc(Resto,Pos2,Acc2,N).
pecas_mal_coloc([p|Resto],Pos,Acc,N):-
	Pos < 5,!,
	Acc2 is Acc+1,
	Pos2 is Pos+1,
	pecas_mal_coloc(Resto,Pos2,Acc2,N).
pecas_mal_coloc([_|Resto],Pos,Acc,N):-
	Pos2 is Pos+1,
	pecas_mal_coloc(Resto,Pos2,Acc,N).

% h2(n) = soma da metade da distancica ate a posicao final para cada peca
%         (o valor e arredondado ao primeiro inteiro superior)

heuristica2([nodo(Conf,Custo)|_],Val):-
	verif_brancos(Conf,B),
	verif_pretos(Conf,P),
	Val is Custo+B+P.


verif_brancos(Conf,Val):-
	verif(b,Conf,1,Val).
verif_pretos(Conf,Val):-
	reverse(Conf,Conf1),
	verif(p,Conf1,1,Val).

verif(_,_,4,0):- !.
verif(Elem,[Elem,Y,Z|Resto],1,N):-
	!,verif(Elem,[Elem,Y,Z|Resto],2,N).
verif(Elem,[X,Elem,Z|Resto],2,N):-
	!,verif(Elem,[X,Elem,Z|Resto],3,N).
verif(Elem,[_,_,Elem|_],3,0):- !.
verif(Elem,[X,Y,Z|Resto],Enessimo,N):-
	tirar_elem(Elem,Resto,Resto2,1,Pos),
	Dif is Pos + 3 - Enessimo,
	Custo is (Dif // 2 + Dif mod 2),
	E1 is Enessimo+1,
	verif(Elem,[X,Y,Z|Resto2],E1,N1),
	N is N1+Custo.

tirar_elem(X,[X|Resto],[nil|Resto],Pos,Pos):-!.
tirar_elem(E,[X|Resto],[X|Resto2],P,Pos):-
	P1 is P+1,
	tirar_elem(E,Resto,Resto2,P1,Pos).






%%%%%%%%%  TESTE DE SUCESSO  %%%%%%%%%%%%%%%

teste_sucesso(nodo([b,b,b,vazio,p,p,p],_)).