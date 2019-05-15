/* 
Um fato expressa alguma verdade sobre um relacionamento. 
Por exemplo,

S�CRATES � HOMEM.

� um fato que define que o indiv�duo S�CRATES pertence � classe HOMEM.
Uma regra, por outro lado, expressa um relacionamento entre fatos. Um relacionamento em uma regra � verdadeiro se os outros relacionamentos nessa regra tamb�m o s�o. Por exemplo,

SE ALGU�M � UM HOMEM, ESSE ALGU�M � MORTAL.

� uma regra que define que se um indiv�duo pertence � classe HOMEM, esse indiv�duo tamb�m pertence � classe MORTAL.
Uma infer�ncia poss�vel a partir desse fato e dessa regra � que 

S�CRATES � MORTAL.

Em PROLOG, esse fato e essa regra s�o expressos da seguinte forma:
e a consulta: � S�CRATES UM MORTAL � expressa e respondida da forma que segue:

mortal(socrates).*/

homem(socrates).
mortal(X):-homem(X).


 
