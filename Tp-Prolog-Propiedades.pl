:- encoding(utf8). /* para no tener problemas con las tildes*/

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

/*personas(carlos, 3, jardin).
personas(ana, 100).
personas(maria, 2, 15).
personas(pedro, 2, 15).
*/

metrosCúbicosDeLaPileta(tinsmithCircle_1774, 0).
metrosCúbicosDeLaPileta(av_moreno_708, 30).
metrosCúbicosDeLaPileta(av_siempreViva_742, 0).
metrosCúbicosDeLaPileta(calle_falsa_123, 0).

/* Punto 1*/

existePropiedadConPiletaDe30Metros(Propiedades) :-
  findall(Propiedad, tienePiletaDe30Metros(Propiedad), Propiedades).

tienePiletaDe30Metros(Propiedad) :-
  metrosCúbicosDeLaPileta(Propiedad,30).

/* Punto 2*/
mismaCantidadDeAmbientes( Propiedad, Propiedad2) :-
  propiedad(Propiedad), propiedad(Propiedad2) , ambiente(Propiedad, Amb), ambiente(Propiedad2, Amb),
  ambientePropiedad( ambiente( Propiedad, Amb), Amb),
  ambientePropiedad( ambiente( Propiedad2, Amb), Amb),
  Propiedad \= Propiedad2.

ambientePropiedad(ambiente(_,Amb),Amb).
