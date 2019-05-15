/* 
Um fato expressa alguma verdade sobre um relacionamento. 
Por exemplo,

SÓCRATES É HOMEM.

é um fato que define que o indivíduo SÓCRATES pertence à classe HOMEM.
Uma regra, por outro lado, expressa um relacionamento entre fatos. Um relacionamento em uma regra é verdadeiro se os outros relacionamentos nessa regra também o são. Por exemplo,

SE ALGUÉM É UM HOMEM, ESSE ALGUÉM É MORTAL.

é uma regra que define que se um indivíduo pertence à classe HOMEM, esse indivíduo também pertence à classe MORTAL.
Uma inferência possível a partir desse fato e dessa regra é que 

SÓCRATES É MORTAL.

Em PROLOG, esse fato e essa regra são expressos da seguinte forma:
e a consulta: É SÓCRATES UM MORTAL é expressa e respondida da forma que segue:

mortal(socrates).*/

homem(socrates).
mortal(X):-homem(X).


 
