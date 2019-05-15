/*Deseja-se construir um predicado Prolog que retorne, dado um determinado ano, o presidente do Brasil naquele ano. O predicado deve-se chamar presidente e possuir dois argumentos: o ano desejado, e uma variável onde será retornada a resposta ao questionamento. A seguir é fornecido o predicado construído:*/

governou(deodoro_da_fonseca,1891,1891).
governou(floriano_peixoto,1891,1894).
governou(prudente_de_moraes,1894,1898).
governou(campos_sales,1898,1902).
governou(rodrigues_alves,1902,1906).
governou(afonso_pena,1906.1909).
governou(nilo_pecanha,1909,1910).
governou(hermes_da_fonseca,1910,1914).
governou(venceslau_bras,1914,1918).
governou(delfim_moreira,1918,1919).
governou(epitacio_pessoa,1919,1922).



presidente(Ano,Presidente) :- governou(Presidente,Inicio,Final), Ano >= Inicio, Ano =< Final.
