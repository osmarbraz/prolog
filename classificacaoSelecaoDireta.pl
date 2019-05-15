/* Metodo da Selecao Direta */

selecionamenor([H|T], TM, [H|TRem]) :- selecionamenor(T, TM, TRem), TM < H.

selecionamenor([H|T], H, T).

selecaodireta(L, [M|ST]):- selecionamenor(L, M, Rem), selecaodireta(Rem, ST).

selecaodireta(S, S).

/* Para utilizar no prolog 
selecionamenor([3, 1, 4, 0, 2, 5], H, T).
H = 0,
T = [3, 1, 4, 2, 5] .

?- selecaodireta([3, 1, 4, 0, 2, 5], Sorted).
Sorted = [0, 1, 2, 3, 4, 5] .
*/