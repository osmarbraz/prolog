
:- dynamic animal/2.

animal(joselito, ovo).
animal(vaca, gado).

:- dynamic tipoPele/2.

tipoPele(joselito, pelo).
tipoPele(vaca, europa).

:- dynamic tipoHabitat/2.

tipoHabitat(joselito, anfibio).
tipoHabitat(vaca, terrestre).

:- dynamic alimentacao/2.

alimentacao(joselito, carnivoro).
alimentacao(vaca, herbivoro).

:- dynamic leite/2.

leite(joselito, sim).
leite(vaca, sim).

:- dynamic tipoRespiracao/2.

tipoRespiracao(joselito, branquial).
tipoRespiracao(vaca, grande).

:- dynamic nPatas/2.

nPatas(joselito, 2).
nPatas(vaca, 4).

:- dynamic classe/7.

classe(ovo, pelo, anfibio, carnivoro, sim, branquial, 2).
classe(end_of_file, end_of_file, end_of_file, end_of_file, end_of_file, end_of_file, end_of_file).
classe(gado, europa, terrestre, herbivoro, sim, grande, 4).
