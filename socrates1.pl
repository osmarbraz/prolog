/* 
Uma vis�o apropriada da interpreta��o de um programa Prolog em termos matem�ticos � a seguinte: O sistema Prolog aceita os fatos e regras como um conjunto de axiomas e a consulta do usu�rio como um teorema a ser provado. A tarefa do sistema � demonstrar que o teorema pode ser provado com base nos axiomas representados pelo conjunto das cl�usulas que constituem o programa. Essa vis�o ser� ilustrada com um exemplo cl�ssico da l�gica de Arist�teles. Sejam os axiomas:

Todos os homens s�o fal�veis.
S�crates � um homem.

Um teorema que deriva logicamente desses dois axiomas �:

S�crates � fal�vel

O primeiro axioma pode ser reescrito como: 
"Para todo X, se X � um homem ent�o X � fal�vel" */

homem(socrates).
falivel(X):- homem(X).


 
