/*
1. João gosta de todo o tipo de comida
2. Maças são comida
3. Frango é comida
4. Qualquer coisa que alguém coma e não cause sua morte é comida
5. Paulo come amendoim e ainda está vivo
6. Susana come tudo o que Paulo come
*/
comida(maca).
comida(frango).
comida(amendoin).
pessoa(paulo).
pessoa(suzana).
naogosta(paulo,amendoin).
gosta(A,B):-comida(B),not(naogosta(A,B)).
come(A,B):-comida(B),pessoa(A),gosta(A,B).
gosto(A,B):-pessoa(B),pessoa(A),not(=(A,B)).
/*vivo(A):-come(A,B).
morto(paulo):-come(paulo,amendoin).
come(susana,A):-come(paulo,A).*/