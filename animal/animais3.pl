
/** 

        Interface e Controle do Sistema

**/

start :-

	write('-----------------------------------------------------'),nl,
	write('Trabalho final de Prolog'),nl,
	write('Alunos: Bruno Imhof           - 06232094'),nl,
	write('        Cesar Barone          - 06232084'),nl,
	write('        Pedro Vitti           - 06132056'),nl,nl,nl,
 	write('----   Reino dos Animais    ----'),nl,nl,
        write('Digite sua Escolha:'), nl,
	write('  '), nl,
	write('"adicionar" para adicionar um animal'), nl,
	write('"adicionarfilo" para adicionar um filo'), nl,
	write('"pesquisar" para pesquisar um animal'), nl,
	write('"sair" para Sair'), nl,
	write('  '), nl,
	read(Escolha),
	processa(Escolha).

menu :- write('----   Reino dos Animais    ----'),nl,nl,
	write('"adicionar" para adicionar um animal'), nl,
	write('"adicionarfilo" para adicionar um filo'), nl,
	write('"pesquisar" para pesquisar um animal'), nl,
	write('"sair" para Sair'), nl,
	write('  '), nl,
	read(Escolha),
	processa(Escolha).

processa(Escolha) :-

	Escolha==adicionar -> addAnimal,menu;
	Escolha==adicionarfilo -> addClasse,menu;
	Escolha==pesquisar -> consultar,menu;
	Escolha==sair -> sair.

sair :-
        write('Bye!').

insereTipoPele(Animal,Escolha) :-

  	write('Continente de Origem?'), nl,
	write(''), nl,
	write('europa, asia, america, oceania, africa'), nl,
        read(Escolha), nl,
	assert(tipoPele(Animal,Escolha)).

insereTipoHabitat(Animal,Escolha) :-
        write('Seu Habitat?'), nl,
	write(''), nl,
	write('anfibio, aquatico, terrestre, aereo'), nl,
	read(Escolha), nl,
	assert(tipoHabitat(Animal,Escolha)).

insereAlimentacao(Animal,Escolha):-

	write('Alimentacao?'), nl,
	write(''), nl,
	write('carnivoro, herbivoro ou onivoro'), nl,
	read(Escolha), nl,
	assert(alimentacao(Animal,Escolha)).

insereLeite(Animal,Escolha):-

	write('Mamifero?'), nl,
	write('sim ou nao'), nl,
	read(Escolha), nl,
	assert(leite(Animal,Escolha)).

insereTipoRespiracao(Animal,Escolha):-

	write('Porte Fisico?'), nl,
	write(''), nl,
	write('microscopico, pequeno, medio, grande, imenso'), nl,
	read(Escolha), nl,
	assert(tipoRespiracao(Animal,Escolha)).

insereNPatas(Animal,Escolha):-

        write('Possui quantas patas?'), nl,
	read(Escolha), nl,
	assert(nPatas(Animal,Escolha)).

insereAnimal(Animal,Classe) :-   assert(animal(Animal,Classe)).

perguntaTipoPele(Escolha) :-

	write('Continente de Origem?'), nl,
	write(''), nl,
	write('europa, asia, america, oceania, africa'), nl,
	read(Escolha), nl.

perguntaTipoHabitat(Escolha) :-

	write('Seu Habitat?'), nl,
	write(''), nl,
	write('anfibio, aquatico, terrestre, aereo'), nl,
	read(Escolha), nl.

perguntaAlimentacao(Escolha):-

	write('Alimentacao?'), nl,
	write(''), nl,
	write('carnivoro, herbivoro ou onivoro'), nl,
	read(Escolha), nl.

perguntaLeite(Escolha):-

	write('Mamifero?'), nl,
	write('sim ou nao'), nl,
	read(Escolha), nl.

perguntaTipoRespiracao(Escolha):-

        write('Porte Fisico?'), nl,
	write(''), nl,
	write('microscopico, pequeno, medio, grande, imenso'), nl,
	read(Escolha), nl.

perguntaNPatas(Escolha):-

	write('Possui quantas patas?'), nl,
	read(Escolha), nl.

perguntaNomeAnimal(Escolha):-

	write('Qual nome do animal?'), nl,
	read(Escolha),!,
	findall(P,animal(Escolha,P),R),
	R == [] -> true;
	animalClass.

animalClass :-

	write('Animal ja classificado'), nl,
	fail.
	
insereClasse(Pele,Hab,Alim,Leite,Resp,NPatas,Classe):-

	write('Nao foi encontrada nehum Filo!!'),
        write('Deseja cria-lo?'), nl,
        read(Escolha),!,
	Escolha == 'sim' -> addClasse(Pele,Hab,Alim,Leite,Resp,NPatas,Classe);
	Escolha == 'nao' -> fail.

sucessoAnimal :-

	write('Animal adicionado').

sucessoClasse :-

	write('Filo adicionado').
	
consultaAnimal(Animal,[]) :-

        nl,
        write(Animal),
	write('Ainda nao classificado'),nl,
        write('Deseja classifica-lo?'),nl,
	write('sim ou nao?'), nl,
	read(Escolha),!,
	Escolha == 'sim' -> addAnimal(Animal);
	Escolha == 'nao' -> intro.

consultaAnimal(Animal,[X|R]) :-

        nl,
	write(Animal),
	write(' pertence ao(s) filo(s): '), nl,
	write('    *' ),
	write([X|R]),nl,
	write('    *                                                 *'), nl.


/**


      Camada Lógica



**/

addAnimal :-

	perguntaNomeAnimal(Animal),
	insereTipoPele(Animal,Pele),
	insereTipoHabitat(Animal,Hab),
	insereAlimentacao(Animal,Alim),
	insereLeite(Animal,Leite),
	insereTipoRespiracao(Animal,Resp),
	insereNPatas(Animal,NPatas),
	defineClasse(Pele,Hab,Alim,Leite,Resp,NPatas,Classe),
	insereAnimal(Animal,Classe),
	tell('arquivos.pl'),
	listing(animal),
	listing(tipoPele),
	listing(tipoHabitat),
	listing(alimentacao),
	listing(leite),
	listing(tipoRespiracao),
	listing(nPatas),
	listing(classe),
	told,
	sucessoAnimal.

addAnimal(Animal) :-

	insereTipoPele(Animal,Pele),
	insereTipoHabitat(Animal,Hab),
	insereAlimentacao(Animal,Alim),
	insereLeite(Animal,Leite),
	insereTipoRespiracao(Animal,Resp),
	insereNPatas(Animal,NPatas),
	defineClasse(Pele,Hab,Alim,Leite,Resp,NPatas,Classe),
	insereAnimal(Animal,Classe),
	tell('arquivos.pl'),
	listing(animal),
	listing(tipoPele),
	listing(tipoHabitat),
	listing(alimentacao),
	listing(leite),
	listing(tipoRespiracao),
	listing(nPatas),
	listing(classe),
	told,
	sucessoAnimal.






defineClasse(Pele,Hab,Alim,Leite,Resp,NPatas,Classe) :-

	findall(P,classe(P,Pele,Hab,Alim,Leite,Resp,NPatas),R),!,
	R == [] -> insereClasse(Pele,Hab,Alim,Leite,Resp,NPatas,Classe);
	primeiro(R,Classe).



addClasse :-
        write('Digite o nome do Filo:'), nl,
	read(Classe),
	perguntaTipoPele(Pele),
	perguntaTipoHabitat(Hab),
	perguntaAlimentacao(Alim),
	perguntaLeite(Leite),
	perguntaTipoRespiracao(Resp),
	perguntaNPatas(Npatas),
	assert(classe(Classe,Pele,Hab,Alim,Leite,Resp,Npatas)),
	tell('arquivos.pl'),
	listing(tipoPele),
	listing(tipoHabitat),
	listing(alimentacao),
	listing(leite),
	listing(tipoRespiracao),
	listing(nPatas),
	listing(classe),
	listing(animal),
	told,
	sucessoClasse.

addClasse(Pele,Hab,Alim,Leite,Resp,Npatas, Classe) :-

	write('Digite o nome do Filo:'), nl,
	write('  '), nl,
	read(Classe),
	assert(classe(Classe,Pele,Hab,Alim,Leite,Resp,Npatas)),
	tell('arquivos.pl'),
	listing(tipoPele),
	listing(tipoHabitat),
	listing(alimentacao),
	listing(leite),
	listing(tipoRespiracao),
	listing(nPatas),
	listing(classe),
	told.


consultar :-

	nl,
        write('Digite o nome do animal'), nl,
	write('  '), nl,
	read(Animal),
	findall(P,animal(Animal,P),R),!,
	consultaAnimal(Animal,R).


primeiro([P|_],P).

:- consult('arquivos.pl').
