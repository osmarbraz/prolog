/* 
Máximo Divisor Comum (mdc) utilizando algoritmo de Euclides
Dado dois inteiros positivos X e Y, seu máximo divisor comum é D.

Perguntar com: 
mdc(2,2,X).
X=2.
ou
mdc(8,4,X).
X=4.
*/

/* Se mdc(X,0) = X */
mdc(X,0,X).

/* Para mdc(X,Y) = mdc(Y, X % y), para n>0  o % é o resto da divisão */
mdc(X,Y,D):- R is X mod Y, mdc(Y,R,D).