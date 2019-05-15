%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ALGORITMO GERAL DE BUSCA BEST-FIRST
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


busca(Inicial):-
        busca_melhor_escolha(nodo(Inicial,0),C,stat(1,1,1),Stat),
        reverse(C,Caminho),
        mostrar_resultado(Caminho),
        mostrar_stat(Stat).


busca_melhor_escolha(Inicial,Sol,StatIn,StatOut):-
    bme([(0,[Inicial])],[],Sol,StatIn,StatOut).

bme([(_,[Nodo|Caminho])|_],_,[Nodo|Caminho],Stat,Stat):-
    teste_sucesso(Nodo).
bme([(_,[Nodo|Caminho])|ESPERANDO],VISITADOS,Sol,StatIn,StatOut):-
    % Identificacao de todos os sucessores do nodo corrente
    findall((V,[Sucessor,Nodo|Caminho]),
            (sucessor(Nodo,Sucessor),
             heuristica2([Sucessor,Nodo|Caminho],V)),
            NovosESPERANDO),
    % Para cada novo nodo criado, verificar se ele ja existe nos nodos
    % que estao esperando para ser expandidos o nos nodo ja visitados. 
    % Se ja existe, conservar apenas o que tem o menor valor
    filtrar_visitados(NovosESPERANDO,VISITADOS,NovosESPERANDO2),
    filtrar_esperando(NovosESPERANDO2,ESPERANDO,ESPERANDO2),
 
    % Atualizar as estatisticas
    length(NovosESPERANDO,N),
    length(ESPERANDO,E),
    length(ESPERANDO2,E2),
    C is E2 - E,
    mudar_stat(StatIn,N,C,1,Stat2),

    % Escolher o melhor nodo e continuar a busca
    por_melhor_encima(ESPERANDO2,ESPERANDO3),
    bme(ESPERANDO3,[Nodo|VISITADOS],Sol,Stat2,StatOut).



% Eliminar os novos nodos que ja foram visitados e que nao tem
% custo menor
filtrar_visitados([],_,[]).
filtrar_visitados([(_,[nodo(X,C)|_])|Resto],Visitados,Resto2):-
     member(nodo(X,C1),Visitados),
     C >= C1,!,
     filtrar_visitados(Resto,Visitados,Resto2).
filtrar_visitados([Nodo|Resto],Visitados,[Nodo|Resto2]):-
     filtrar_visitados(Resto,Visitados,Resto2).


% Combina os novos nodos com os nodos ja esperando.
% Se um nodo ja existe na lista dos nodos esperando, conservar
% apenas o que tem custo menor
filtrar_esperando([],N,N).
filtrar_esperando([(Val,[nodo(X,T)|Cam])|Resto],ESPERANDO,NodosOut):-
    member((Val1,[nodo(X,_)|_]),ESPERANDO),!,
    (Val < Val1 ->
	substituir((Val,[nodo(X,T)|Cam]),ESPERANDO,ESPERANDO2);
        ESPERANDO2 = ESPERANDO),
    filtrar_esperando(Resto,ESPERANDO2,NodosOut).
filtrar_esperando([N|Resto],ESPERANDO,NodosOut):-
    filtrar_esperando(Resto,[N | ESPERANDO],NodosOut).


% Colocar no inicio da lista o nodo que tem o menor valor de custo
por_melhor_encima([],[]).
por_melhor_encima([(Val,X)|L],[S|R]):-
    busca_melhor(L,(Val,X),S,R).

busca_melhor([],T,T,[]).
busca_melhor([(Val1,X)|L],(Val,T),S,[(Val,T)|R]):-
    Val1 < Val,!,
    busca_melhor(L,(Val1,X),S,R).
busca_melhor([(Val1,X)|L],(Val,T),S,[(Val1,X)|R]):-
    busca_melhor(L,(Val,T),S,R).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Funcoes uteis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


mostrar_stat(stat(N,C,V)):-
    write('Criados:  '),write(N),nl,
    write('Criados conservados:  '),write(C),nl,
    write('Visitados:  '),write(V),nl.

mudar_stat(stat(N,C,V),N1,C1,V1,stat(N2,C2,V2)):-
	N2 is N+N1,
	C2 is C+C1,
	V2 is V+V1.

% Imprimir a solucao
mostrar_resultado([nodo(Estado,Custo)]):-
    write(Estado),write(' '),nl,
    write('Custo:   '),write(Custo),nl.
mostrar_resultado([nodo(Estado,_)|Caminho]):-
    write(Estado),write(' '),nl,
    mostrar_resultado(Caminho).


% Substituir um nodo por um outro que tem o mesmo estado mas 
% um custo diferente
substituir(_,[],[]).
substituir((Val,[nodo(X,T)|Cam]),[(_,[nodo(X,_)|_])|Resto],
            [(Val,[nodo(X,T)|Cam])|Resto]):- !.
substituir(N,[X|Resto],[X|R2]):-
	substituir(N,Resto,R2).
