// To parse this JSON data, do
//
//     final prospectoRequest = prospectoRequestFromJson(jsonString);

import 'dart:convert';

ProspectoRequest prospectoRequestFromJson(String str) =>
    ProspectoRequest.fromJson(json.decode(str));

String prospectoRequestToJson(ProspectoRequest data) =>
    json.encode(data.toJson());

class ProspectoRequest {
  ProspectoRequest({
    this.nombres,
    this.primerApellido,
    this.segundoApellido,
    this.calle,
    this.numeroInterior,
    this.colonia,
    this.codigoPostal,
    this.telefono,
    this.rfc,
    this.estatus,
  });

  String nombres;
  String primerApellido;
  String segundoApellido;
  String calle;
  String numeroInterior;
  String colonia;
  int codigoPostal;
  String telefono;
  String rfc;
  int estatus;

  factory ProspectoRequest.fromJson(Map<String, dynamic> json) =>
      ProspectoRequest(
        nombres: json["nombres"],
        primerApellido: json["primerApellido"],
        segundoApellido:
            json["segundoApellido"] != '' ? json["segundoApellido"] : '',
        calle: json["calle"],
        numeroInterior: json["numeroInterior"],
        colonia: json["colonia"],
        codigoPostal: json["codigoPostal"],
        telefono: json["telefono"],
        rfc: json["rfc"],
        estatus: json["estatus"],
      );

  Map<String, dynamic> toJson() => {
        "nombres": nombres,
        "primerApellido": primerApellido,
        "segundoApellido": segundoApellido,
        "calle": calle,
        "numeroInterior": numeroInterior,
        "colonia": colonia,
        "codigoPostal": codigoPostal,
        "telefono": telefono,
        "rfc": rfc,
        "estatus": estatus,
      };
}
