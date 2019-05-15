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
filha(A,B):-progenitor(B,A),feminino(A).
pai(A,B):-progenitor(A,B),masculino(A).
mae(A,B):-progenitor(A,B),feminino(A).
av�(A,C):-progenitor(A,B),progenitor(B,C),masculino(A).
av�(A,C):-progenitor(A,B),progenitor(B,C),feminino(A).

