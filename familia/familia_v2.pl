/*Osmar*/
/*fatos*/
/* 5 masculino*/
masculino(mario).
masculino(manuel).
masculino(antonio).
masculino(joao).
/* 4 feminino*/
feminino(maria).
feminino(teresa).
feminino(joana).
feminino(rosa).
feminino(rita).
/* familia mario e maria*/
progenitor(mario, manuel).
progenitor(mario, teresa).
progenitor(maria, manuel).
progenitor(maria, teresa).
/* familia manuel e joana*/
progenitor(manuel, joao).
progenitor(joana, joao).
/* familia teresa e antonio*/
progenitor(teresa, rita).
progenitor(antonio, rita).
/*Regras*/
/* Para todo A e B, A � filho de B se B � progenitor de A e A � masculino*/
filho(A,B):-progenitor(B,A),masculino(A).
/* Para todo A e B, A � filha de B se B � progenitor de A e A � feminino*/
filha(A,B):-progenitor(B,A),feminino(A).
/* Para todo A e B, A � pai de B se A � progenitor de B e A � masculino*/
pai(A,B):-progenitor(A,B),masculino(A).
/* Para todo A e B, A � m�e de B se A � progenitor de B e A � feminino*/
mae(A,B):-progenitor(A,B),feminino(A).
/* Para todo A e C, A � av� de C se A � progenitor de B e B � progenitor de C e A � masculino*/
av�(A,C):-progenitor(A,B),progenitor(B,C),masculino(A).
/* Para todo A e C, A � av� de C se A � progenitor de B e B � progenitor de C e A � feminino*/
av�(A,C):-progenitor(A,B),progenitor(B,C),feminino(A).
/* Para todo A e B, A � irma de B se C � progenitor de A e C � progenitor de B 
e A � diferente de B e A � feminino*/
irma(A,B):-progenitor(C,A),progenitor(C,B),not(=(A,B)),feminino(A).
/* Para todo A e B, A � irmao de B se C � progenitor de A e C � progenitor de B 
e A � diferente de B e A � masculino*/
irmao(A,B):-progenitor(C,A),progenitor(C,B),not(=(A,B)),masculino(A).
/* Para todo A e B, A � tio de B se A e C s�o irm�os e C � progenitor de B*/
tio(A,B):-irmao(A,C), progenitor(C,B).
/* Para todo A e B, A � tia de B se A e C s�o irmas e C � progenitor de B*/
tia(A,B):-irma(A,C), progenitor(C,B).
/* Para todo A e B, A � sobrinho de B se A � filho de C e C � irmao de B
 sobrinho(A,B):-tio(B,A) */
sobrinho(A,B):-filho(A,C),irmao(C,B).
/* Para todo A e B, A � sobrinhA de B se A � filha de C e C � irma de B
sobrinha(A,B):-tia(B,A) */
sobrinha(A,B):-filha(A,C),irma(C,B).
/* Para todo A e B, A � primo de B se X � irmao de Y  e X � progenitor de A e 
Y � progenitor de B e A e B sao diferentes A � filho de C e irmao de A*/
primo(A,B):-irmao(X,Y),progenitor(X,A), progenitor(Y,B), not(=(A,B)).
/* Para todo A e B, A � primo de B se X � irma de Y  e X � progenitor de A e 
Y � progenitor de B e A e B sao diferentes A � filho de C e irmao de A*/
primo(A,B):-irma(X,Y),progenitor(X,A), progenitor(Y,B), not(=(A,B)).