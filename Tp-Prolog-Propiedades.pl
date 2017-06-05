:- encoding(utf8). /* para no tener problemas con las tildes*/

persona(carlos).
persona(ana).
persona(maría).
persona(pedro).
persona(chamaleon).

propiedad(tinsmithCircle_1774).
propiedad(av_moreno_708).
propiedad(av_siempreViva_742).
propiedad(calle_falsa_123).

precioAlquiler(tinsmithCircle_1774, 700).
precioAlquiler(av_moreno_708, 2000).
precioAlquiler(av_siempreViva_742, 1000).
precioAlquiler(calle_falsa_123, 200).

ambiente(tinsmithCircle_1774,3).
ambiente(av_moreno_708, 7).
ambiente(av_siempreViva_742, 4).
ambiente(calle_falsa_123, 3).

extra(tinsmithCircle_1774, jardin).
extra(av_moreno_708, jardin).
extra(av_siempreViva_742, jardin).
extra(calle_falsa_123, no).

metrosCúbicosDeLaPileta(tinsmithCircle_1774, 0).
metrosCúbicosDeLaPileta(av_moreno_708, 30).
metrosCúbicosDeLaPileta(av_siempreViva_742, 0).
metrosCúbicosDeLaPileta(calle_falsa_123, 0).

/* Punto 1*/

existePropiedadConPiletaDe30Metros(Propiedades) :-
  findall(Propiedad, tienePiletaDe30Metros(Propiedad), Propiedades).

tienePiletaDe30Metros(Propiedad) :-
  metrosCúbicosDeLaPileta(Propiedad,30). /*Funciona pero hay que arreglarlo*/

/* Punto 2*/
mismaCantidadDeAmbientes( Propiedad, Propiedad2) :-
  propiedad(Propiedad), propiedad(Propiedad2) ,
  ambiente(Propiedad, Amb),
  ambiente(Propiedad2, Amb),
  Propiedad \= Propiedad2.

/* Punto 3*/

quiere(pedro, caracteristicas( ambiente(2), metrosCúbicosDeLaPileta(15))).
quiere(carlos, caracteristicas( ambiente(3), extra(jardin))).
quiere(maría, caracteristicas( ambiente(2), metrosCúbicosDeLaPileta(15))).
quiere(ana, caracteristicas( metrosCúbicosDeLaPileta(100))).

quiere(chamaleon,Caracteristicas):-
  persona(Persona),
  Persona \= chamaleon,
  quiere(Persona,Caracteristicas).

/* Punto 4*/

cumplePropiedad(Propiedad,Deseo):-
  propiedadDeseada(Propiedad,Deseo).

propiedadDeseada(Propiedad,extra(Extra)):-
    extra(Propiedad,Extra).
propiedadDeseada(Propiedad,precioAlquiler(Precio)):-
    precioAlquiler(Propiedad,Precio).
propiedadDeseada(Propiedad,ambiente(Ambiente)):-
  ambiente(Propiedad,Amb),
  cantOriginalMayorOIgualALaDeseada(Amb,Ambiente).
propiedadDeseada(Propiedad,metrosCúbicosDeLaPileta(MetrosCúbicos)):-
  metrosCúbicosDeLaPileta(Propiedad,MC),
  cantOriginalMayorOIgualALaDeseada(MC,MetrosCúbicos).

cantOriginalMayorOIgualALaDeseada(Original,Deseada):-
  Original >= Deseada.
