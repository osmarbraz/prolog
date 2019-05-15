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
/* Para todo A e B, A é filho de B se B é progenitor de A e A é masculino*/
filho(A,B):-progenitor(B,A),masculino(A).
/* Para todo A e B, A é filha de B se B é progenitor de A e A é feminino*/
filha(A,B):-progenitor(B,A),feminino(A).
/* Para todo A e B, A é pai de B se A é progenitor de B e A é masculino*/
pai(A,B):-progenitor(A,B),masculino(A).
/* Para todo A e B, A é mãe de B se A é progenitor de B e A é feminino*/
mae(A,B):-progenitor(A,B),feminino(A).
/* Para todo A e C, A é avô de C se A é progenitor de B e B é progenitor de C e A é masculino*/
avô(A,C):-progenitor(A,B),progenitor(B,C),masculino(A).
/* Para todo A e C, A é avó de C se A é progenitor de B e B é progenitor de C e A é feminino*/
avó(A,C):-progenitor(A,B),progenitor(B,C),feminino(A).
/* Para todo A e B, A é irma de B se C é progenitor de A e C é progenitor de B 
e A é diferente de B e A é feminino*/
irma(A,B):-progenitor(C,A),progenitor(C,B),not(=(A,B)),feminino(A).
/* Para todo A e B, A é irmao de B se C é progenitor de A e C é progenitor de B 
e A é diferente de B e A é masculino*/
irmao(A,B):-progenitor(C,A),progenitor(C,B),not(=(A,B)),masculino(A).
/* Para todo A e B, A é tio de B se A e C são irmãos e C é progenitor de B*/
tio(A,B):-irmao(A,C), progenitor(C,B).
/* Para todo A e B, A é tia de B se A e C são irmas e C é progenitor de B*/
tia(A,B):-irma(A,C), progenitor(C,B).
/* Para todo A e B, A é sobrinho de B se A é filho de C e C é irmao de B
 sobrinho(A,B):-tio(B,A) */
sobrinho(A,B):-filho(A,C),irmao(C,B).
/* Para todo A e B, A é sobrinhA de B se A é filha de C e C é irma de B
sobrinha(A,B):-tia(B,A) */
sobrinha(A,B):-filha(A,C),irma(C,B).
/* Para todo A e B, A é primo de B se X é irmao de Y  e X é progenitor de A e 
Y é progenitor de B e A e B sao diferentes A é filho de C e irmao de A*/
primo(A,B):-irmao(X,Y),progenitor(X,A), progenitor(Y,B), not(=(A,B)).
/* Para todo A e B, A é primo de B se X é irma de Y  e X é progenitor de A e 
Y é progenitor de B e A e B sao diferentes A é filho de C e irmao de A*/
primo(A,B):-irma(X,Y),progenitor(X,A), progenitor(Y,B), not(=(A,B)).