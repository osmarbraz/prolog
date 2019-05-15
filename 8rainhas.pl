/*
Metodologia usada na resolucao do problema das 8 rainhas
1. Gerar uma potencial solucao – com o predicado perm
2. Verificar se a solucao e valida
3. Se nao for valida retroceder para encontrar a potencial solucao seguinte
Perguntar:
nrainhas(X).
*/
perm([],[]).
perm(Lista,[Inicio|Fim]) :- remove(Inicio,Lista,Res),perm(Res,Fim).

remove(Inicio,[Inicio|Fim],Fim).
remove(X,[Inicio|Fim1],[Inicio|Fim2]) :- remove(X,Fim1,Fim2).

nrainhas(Res) :- perm([1,2,3,4,5,6,7,8],Res),diagonaisOK(Res).
	
diagonaisOK([_]).

diagonaisOK([Rainha|OutrasRainhas]) :- posicaoOK(Rainha,1,OutrasRainhas), diagonaisOK(OutrasRainhas).

posicaoOK(_,_,[]).

posicaoOK(Col,DistLinha,[Rainha|OutrasRainhas]) :-	
	DiagKO1 is Col + DistLinha, Rainha =\= DiagKO1,	
	DiagKO2 is Col - DistLinha, Rainha =\= DiagKO2,	
	DistLinha1 is DistLinha + 1,
	posicaoOK(Col,DistLinha1,OutrasRainhas).