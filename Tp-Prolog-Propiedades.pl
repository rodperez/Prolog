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

tiene(av_moreno_708, precioAlquiler(2000)).
tiene(av_moreno_708, ambiente(7)).
tiene(av_moreno_708, jardin).
tiene(av_moreno_708, metrosCúbicosDeLaPileta(30)).
tiene(tinsmithCircle_1774, precioAlquiler(700)).
tiene(tinsmithCircle_1774, ambiente(3)).
tiene(tinsmithCircle_1774, jardin).
tiene(av_siempreViva_742, precioAlquiler(1000)).
tiene(av_siempreViva_742, ambiente(4)).
tiene(av_siempreViva_742, jardin).
tiene(calle_falsa_123, precioAlquiler(200)).
tiene(calle_falsa_123, ambiente(3)).

/* Punto 1 Funciona Perfecto */

existePropiedadConPiletaDe30Metros(Propiedades) :-
  findall(Propiedad, tienePiletaDe30Metros(Propiedad), Propiedades).

tienePiletaDe30Metros(Propiedad) :-
  tiene(Propiedad, metrosCúbicosDeLaPileta(30)).

/* Punto 2 Funciona Perfecto */

mismaCantidadDeAmbientes(Propiedad, Propiedad2) :-
  propiedad(Propiedad), propiedad(Propiedad2),
  tiene(Propiedad, ambiente(Amb)),
  tiene(Propiedad2,ambiente(Amb)),
  Propiedad \= Propiedad2.

/* Punto 3 Funciona Perfeco */

quiere(carlos, caracteristicas(ambiente(3), jardin)).
quiere(pedro, caracteristicas(ambiente(2), metrosCúbicosDeLaPileta(15))).
quiere(maría, caracteristicas(ambiente(2), metrosCúbicosDeLaPileta(15))).
quiere(ana, caracteristicas(metrosCúbicosDeLaPileta(100))).

quiere(chamaleon,Caracteristicas):-
  persona(Persona),
  Persona \= chamaleon,
  quiere(Persona,Caracteristicas).

/* punto 4 */

cumplePropiedad(Propiedad,Deseo):-
  propiedadDeseada(Propiedad,Deseo).

propiedadDeseada(Propiedad,Exterior)):-
    tiene(Propiedad,Exterior).

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
