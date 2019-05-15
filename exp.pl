/* Calcular o exponencial de um n�mero. 
O predicado ser� exp(B,E,N) onde B � o n�mero da base, E � o expoente, e N � o resultado.

 exp(B,E,N):- N is B**E.
 
 Perguntar:
 exp(2,4,X).
 X=16.
 
*/

exp(B,0,1).

exp(B,1,B).

exp(B,E,R):- E1 is E - 1, exp(B,E1,R1), R is B * R1.
