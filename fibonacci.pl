/* 
Gerar a série de Fibonacci até num valor N dado.
0,1,1,2,3,5,8,13,21,....
Perguntar com  
fibonacci(7,X).
X=13
O sétimo termo na sequencia fibonacci é 13

*/
fibonacci(0,0).
fibonacci(1,1).
fibonacci(N,S):- 
       N>0,    
	   N2 is N-2, fibonacci(N2,S2),	   
	   N1 is N-1, fibonacci(N1,S1), 
	   S is S1 + S2.
	   
