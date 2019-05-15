/* 
Uma visão apropriada da interpretação de um programa Prolog em termos matemáticos é a seguinte: O sistema Prolog aceita os fatos e regras como um conjunto de axiomas e a consulta do usuário como um teorema a ser provado. A tarefa do sistema é demonstrar que o teorema pode ser provado com base nos axiomas representados pelo conjunto das cláusulas que constituem o programa. Essa visão será ilustrada com um exemplo clássico da lógica de Aristóteles. Sejam os axiomas:

Todos os homens são falíveis.
Sócrates é um homem.

Um teorema que deriva logicamente desses dois axiomas é:

Sócrates é falível

O primeiro axioma pode ser reescrito como: 
"Para todo X, se X é um homem então X é falível" */

homem(socrates).
falivel(X):- homem(X).


 
