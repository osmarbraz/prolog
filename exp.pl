/* Calcular o exponencial de um número. 
O predicado será exp(B,E,N) onde B é o número da base, E é o expoente, e N é o resultado.

 exp(B,E,N):- N is B**E.
 
 Perguntar:
 exp(2,4,X).
 X=16.
 
*/

exp(B,0,1).

exp(B,1,B).

exp(B,E,R):- E1 is E - 1, exp(B,E1,R1), R is B * R1.
