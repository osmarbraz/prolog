%  Autor: Hemerson Pistori
%  Objetivo: Responde perguntas sobre minha
%     arvore genealogica (um pequeno pedaco)
%  Exemplo da utilizacao:
%  chdir("u:\\xxx\\yyy"). /* Muda para diretorio aonde
%                     esta o programa familia.pl */
%  consult(familia).  /* Carrega este programa */
%  hemerson e pai de julia. /* Devolve yes */
%  hemerson e pai de alcides. /* Devolve no */
%  hemerson e irmao de anderson. /* Devolve yes */
%  Quem e irmao de hemerson. /* Devolve Quem=tatiane.
%         digite ; para outros irmaos */
%  Quem e filho de alcides. 
%  filho(X,alcides). /* Mostra filhos de alcides */
%  halt. /* Sai do prolog */
%
%  Para acrescentar novas sentencas diretamente pelo interpretador
%  (na linha de comando do prolog) use o predicado asserta, ou
%  assertz. Eg.: asserta(pai(hilario,marcos)). 
%
%  Sugestao:
%  Altere fatos para representar a sua 
%    arvore genealogica.
%
%  Obs: Meu pai se chama Alcides e minha mae Emilia.
%       Tenho dois filhos: Julia e Hemerson Bragato (hemersonb)
%       e tres irmaos: Tatiane, Jeferson e Anderson.

homem(hemerson).
homem(hemersonb).
homem(alcides).
homem(herculano).
homem(anderson).
homem(jeferson).
homem(moacir).
homem(junior).
mulher(emilia).
mulher(cristina).
mulher(julia).
mulher(tatiane).
pai(hemerson,julia).
pai(hemerson,hemersonb).
pai(alcides,hemerson).
pai(herculano,alcides).
pai(alcides,tatiane).
pai(alcides,anderson).
pai(alcides,jeferson).
pai(herculano,valdir).
pai(herculano,moacir).
pai(herculano,hilario).
pai(moacir,junior).
pai(moacir,juliana).
pai(moacir,luciana).
pai(valdir,caroline).
pai(valdir,carine).
pai(valdir,rafael).
esposa(emilia,alcides).
esposa(maria,herculano).
esposa(cristina,valdir).

% Aqui comecam a ser representadas as regras:

irmao(X,Y):-pai(Z,X),pai(Z,Y),not(=(X,Y)).
filho(X,Y):-pai(Y,X).
avo(X,Y):-pai(Z,Y),pai(X,Z).
avo(X,Y):-mae(Z,Y),mae(X,Z).
mae(X,Y):-esposa(X,Z),pai(Z,Y).
ancestral(X,Y):-pai(X,Y).
ancestral(X,Y):-mae(X,Y).
ancestral(X,Y):-pai(X,Z),ancestral(Z,Y).
ancestral(X,Y):-mae(X,Z),ancestral(Z,Y).
tio(X,Y):-pai(Z,Y),irmao(X,Z).
tio(X,Y):-mae(Z,Y),irmao(X,Z).
sobrinho(X,Y):-tio(Y,X).
primo(X,Y):-pai(Z,X),pai(W,Y),irmao(Z,W).


% Aqui eu defino alguns predicados para possibilitar
% que as perguntas sejam feitas em uma linguagem
% proxima a natural:

e(X,pai(do(Y))):-pai(X,Y).
e(X,pai(da(Y))):-pai(X,Y).
e(X,pai(de(Y))):-pai(X,Y).
e(X,tio(do(Y))):-tio(X,Y).
e(X,tio(da(Y))):-tio(X,Y).
e(X,tio(de(Y))):-tio(X,Y).
e(X,avo(dd(Y))):-avo(X,Y).
e(X,avo(da(Y))):-avo(X,Y).
e(X,irmao(da(Y))):-irmao(X,Y).
e(X,irmao(do(Y))):-irmao(X,Y).
e(X,irmao(de(Y))):-irmao(X,Y).

% Aqui eu defino alguns operadores que permitem
% que eu escreva um predicado sem utilizar a forma 
% padrao: predicado(arq1,arq2,...).

:-op(400,xfx,foi).
:-op(400,xfx,e).
:-op(300,fx,pai).
:-op(300,fx,mae).
:-op(300,fx,tio).
:-op(300,fx,irmao).
:-op(300,fx,avo).
:-op(200,fx,do).
:-op(200,fx,da).
:-op(200,fx,de).

:-op(500,fx,rua).

