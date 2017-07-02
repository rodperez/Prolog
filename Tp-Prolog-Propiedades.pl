:- encoding(utf8). /* para no tener problemas con las tildes*/

persona(carlos).
persona(ana).
persona(maría).
persona(pedro).
persona(chamaleon).

propiedad(Propiedad):- tiene(Propiedad,_).

tiene(av_moreno_708, ambiente(7)).
tiene(av_moreno_708, jardin).
tiene(av_moreno_708, pileta(30)).
tiene(av_moreno_708,intalaciones([aireAcondicionado,extractor,calefacciónPorLozaRadiante,vidriosDobles])).
tiene(tinsmithCircle_1774, ambiente(3)).
tiene(tinsmithCircle_1774, jardin).
tiene(tinsmithCircle_1774,intalaciones([aireAcondicionado,extractor,calefacciónAGas])).
tiene(av_siempreViva_742, ambiente(4)).
tiene(av_siempreViva_742, jardin).
tiene(av_siempreViva_742,intalaciones([calefacciónAGas])).
tiene(calle_falsa_123,ambiente(3)).


precioPropiedad(av_moreno_708,2000).
precioPropiedad(tinsmithCircle_1774,700).
precioPropiedad(av_siempreViva_742,1000).
precioPropiedad(calle_falsa_123,200).

/*Punto 1
  consulta:
  tiene(Propiedad, pileta(30)).
  respuesta: Propiedad = av_moreno_708.*/

/*Punto 2
  consulta:
  tiene(Propiedad, ambiente(Amb)), tiene(Propiedad2,ambiente(Amb)), Propiedad \= Propiedad2.
  respuesta : Propiedad = tinsmithCircle_1774,
              ambiente = 3,
              Propiedad2 = calle_falsa_123.*/

/*Punto 3
  consulta : quiere(pedro,Deseo).
  respuesta: Deseo = ambiente(2),
             Deseo = pileta(15).*/

quiere(carlos, ambiente(3)).
quiere(carlos, jardin).
quiere(pedro, ambiente(2)).
quiere(pedro, pileta(15)).
quiere(pedro,intalaciones(vidriosDobles)).
quiere(pedro,intalaciones(calefacciónPorLozaRadiante)).
quiere(maría, ambiente(9)). % TODO: Quiere DOS ambientes. Algunas soluciones de más abajo son diferentes por esto.
quiere(maría, pileta(15)).
quiere(ana, pileta(100)).
quiere(ana,intalaciones(aireAcondicionado)).
quiere(ana,intalaciones(vidriosDobles)).
quiere(fede,planta). /* prueba */ % TODO: Podés sacarlo.

quiere(chamaleon,Caracteristicas):-
  persona(Persona),
  Persona \= chamaleon,
  quiere(Persona,Caracteristicas).

/* punto 4 */

cumple(Propiedad,Caracteristica):-
  quiere(_,Caracteristica),
    tiene(Propiedad,Caracteristica).

cumple(Propiedad,ambiente(AmbientesDeseados)):-
  quiere(_,ambiente(AmbientesDeseados)),
  tiene(Propiedad,ambiente(AmbientesOriginales)),
  AmbientesOriginales >= AmbientesDeseados.

cumple(Propiedad,pileta(MetrosCúbicosDeseados)):-
  quiere(_,pileta(MetrosCúbicosDeseados)),
  tiene(Propiedad,pileta(MetrosCúbicosOriginales)),
  MetrosCúbicosOriginales >= MetrosCúbicosDeseados.

cumple(Propiedad,intalaciones(InstalacionesDeseadas)):-
  quiere(_,intalaciones(InstalacionesDeseadas)),
  tiene(Propiedad,intalaciones(InstalacionesOriginales)),
  forall(member(Instalacion,InstalacionesDeseadas),member(Instalacion,InstalacionesOriginales)).
/*

% TODO: No hacía falta saber cuál propiedad era. Con el _ el motor ya nos dice si existe una solución o no.
-? cumple(Propiedad,ambiente(2)).
Propiedad = av_moreno_708 ;
Propiedad = tinsmithCircle_1774 ;
Propiedad = av_siempreViva_742 ;
Propiedad = calle_falsa_123 ;
Propiedad = av_moreno_708 ;
Propiedad = tinsmithCircle_1774 ;
Propiedad = av_siempreViva_742 ;
Propiedad = calle_falsa_123 ;
Propiedad = av_moreno_708 ;
Propiedad = tinsmithCircle_1774 ;
Propiedad = av_siempreViva_742 ;
Propiedad = calle_falsa_123 ;
Propiedad = av_moreno_708 ;
Propiedad = tinsmithCircle_1774 ;
Propiedad = av_siempreViva_742 ;
Propiedad = calle_falsa_123 ;

  Punto 5
-?quiere(pedro,Deseo),cumple(Propiedad,Deseo).
Deseo = ambiente(2),
Propiedad = av_moreno_708 ;
Deseo = ambiente(2),
Propiedad = tinsmithCircle_1774 ;
Deseo = ambiente(2),
Propiedad = av_siempreViva_742 ;
Deseo = ambiente(2),
Propiedad = calle_falsa_123 ;
Deseo = ambiente(2),
Propiedad = av_moreno_708 ;
Deseo = ambiente(2),
Propiedad = tinsmithCircle_1774 ;
Deseo = ambiente(2),
Propiedad = av_siempreViva_742 ;
Deseo = ambiente(2),
Propiedad = calle_falsa_123 ;
Deseo = ambiente(2),
Propiedad = av_moreno_708 ;
Deseo = ambiente(2),
Propiedad = tinsmithCircle_1774 ;
Deseo = ambiente(2),
Propiedad = av_siempreViva_742 ;
Deseo = ambiente(2),
Propiedad = calle_falsa_123 ;
Deseo = ambiente(2),
Propiedad = av_moreno_708 ;
Deseo = ambiente(2),
Propiedad = tinsmithCircle_1774 ;
Deseo = ambiente(2),
Propiedad = av_siempreViva_742 ;
Deseo = ambiente(2),
Propiedad = calle_falsa_123 ;
Deseo = pileta(15),
Propiedad = av_moreno_708 ;
Deseo = pileta(15),
Propiedad = av_moreno_708 ;
Deseo = pileta(15),
Propiedad = av_moreno_708 ;
Deseo = pileta(15),
Propiedad = av_moreno_708 ;

    Punto 6
cumple(av_moreno_708,Deseo).
Deseo = jardin ;
Deseo = jardin ;
Deseo = ambiente(3) ;
Deseo = ambiente(2) ;
Deseo = ambiente(2) ;
Deseo = ambiente(3) ;
Deseo = ambiente(2) ;
Deseo = ambiente(2) ;
Deseo = pileta(15) ;
Deseo = pileta(15) ;
Deseo = pileta(15) ;
Deseo = pileta(15) ;*/

/* punto 7 */

ningunaCumple(Caracteristicas):-
  quiere(_,Caracteristicas),
  not(cumple(_,Caracteristicas)).

/*
Caracteristica = ambiente(9) ;
Caracteristica = pileta(100) ;
Caracteristica = planta ;
Caracteristica = pileta(100) ;
Caracteristica = ambiente(9) ;
*/

/* punto 8 */

cumpleTodo(Propiedad,Persona):-
  propiedad(Propiedad), persona(Persona),
  forall(quiere(Persona,Caracteristicas), cumple(Propiedad,Caracteristicas)).

/*
cumpleTodo(Propiedad,Persona).
Propiedad = av_moreno_708,
Persona = carlos ;
Propiedad = av_moreno_708,
Persona = pedro ;
Propiedad = av_moreno_708,
Persona = carlos ;
Propiedad = av_moreno_708,
Persona = pedro ;
Propiedad = av_moreno_708,
Persona = carlos ;
Propiedad = av_moreno_708,
Persona = pedro ;
Propiedad = tinsmithCircle_1774,
Persona = carlos ;
Propiedad = tinsmithCircle_1774,
Persona = carlos ;
Propiedad = av_siempreViva_742,
Persona = carlos ;
Propiedad = av_siempreViva_742,
Persona = carlos ; */

/* 9 */

esMásBarata(Propiedad,Propiedad2):-
  precioPropiedad(Propiedad,Precio),
  precioPropiedad(Propiedad2,Precio2),
  Precio =< Precio2.

mejorOpción(Propiedad,Persona):-
  cumpleTodo(Propiedad,Persona),
  forall(cumpleTodo(Propiedad2,Persona),esMásBarata(Propiedad,Propiedad2)).

/*
TODO: Falta la segunda opción.

Vos decís "Es la mejor, si todas las que cumplen con lo que quiere tienen un precio mayor o igual".

La otra opción es "Es la mejor, si NO EXISTE NINGUNA que cumpla todo y tenga un precio MENOR".

Así que se puede hacer con not. Y fijate que antes es "mayor o igual" y ahora es "menor". Queda como una doble negación.
Siempre un forall se puede pasar a un not de esa forma.

*/

/* TODO: ¿Y la consulta?
Prop = av_moreno_708,
Persona = pedro ;
Prop = av_moreno_708,
Persona = pedro ;
Prop = av_moreno_708,
Persona = pedro ;
Prop = av_moreno_708,
Persona = pedro ;
Prop = tinsmithCircle_1774,
Persona = carlos ;
Prop = tinsmithCircle_1774,
Persona = carlos ;
Prop = tinsmithCircle_1774,
Persona = carlos ;
*/

/* 10 */

satisfecho(Persona):-
  cumpleTodo(Propiedad,Persona),
  not((cumpleTodo(Propiedad2,Persona),Propiedad \= Propiedad2)).
/*
TODO: ¿Está satisfecho si solo UNA propiedad cumple todo? ¿Si hay 10, no estaría satisfecho? El enunciado dice "al menos una".
Así que lo del not vas a tener que borrarlo.
Y ahí, fijate si te interesa saber cuál es la Propiedad. ¿Querés saber cuál es, o solo que exista alguna?
*/

efectividad(Efectividad):-
  cantidadPersonasSastisfechas(CantidadTotalSatisfecha),
  cantidadPersonas(CantidadTotal),
  Efectividad is CantidadTotalSatisfecha / CantidadTotal.

cantidadPersonasSastisfechas(CantidadTotal):-
  findall(Satisfecho,satisfecho(Satisfecho),Satisfechos),
  length(Satisfechos,Cantidad),
  CantidadTotal is Cantidad. % TODO: NO!!! El is es para operaciones que hay que reducir. Borrá esto y usá un mismo nombre de variable para la cantidad.

cantidadPersonas(CantidadTotal):-
  findall(Persona,persona(Persona),Personas),
  length(Personas,Cantidad),
  CantidadTotal is Cantidad. % TODO: Idem arriba.
/* 11 */

esChica(Propiedad):-
  tiene(Propiedad,ambiente(1)).
esChica(Propiedad):-
  tiene(Propiedad,_), % TODO: Sería bueno contar con un predicado propiedad/1, que unifique a la propiedad a partir de tiene/2.
  not(tiene(Propiedad,ambiente(_))).

propiedadTop(Propiedad):-
  cumple(Propiedad,intalaciones([aireAcondicionado])),
  not(esChica(Propiedad)).
  
% TODO: Falta la parte teórica. Tanto lo de por qué no agregaste algunas cosas del punto 1 (lo de no tener jardín y eso), como lo de instalaciones que se pide al final.
