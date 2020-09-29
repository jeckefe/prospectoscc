// To parse this JSON data, do
//
//     final listadoResponse = listadoResponseFromJson(jsonString);

import 'dart:convert';

ListadoResponse listadoResponseFromJson(String str) =>
    ListadoResponse.fromJson(json.decode(str));

String listadoResponseToJson(ListadoResponse data) =>
    json.encode(data.toJson());

class ListadoResponse {
  ListadoResponse({
    this.error,
    this.message,
    this.data,
  });

  bool error;
  String message;
  List<Datum> data;

  factory ListadoResponse.fromJson(Map<String, dynamic> json) =>
      ListadoResponse(
        error: json["error"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.nombres,
    this.primerApellido,
    this.segundoApellido,
    this.estatus,
    this.observaciones,
  });

  String nombres;
  String primerApellido;
  String segundoApellido;
  String estatus;
  String observaciones;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nombres: json["nombres"],
        primerApellido: json["primerApellido"],
        segundoApellido: json["segundoApellido"],
        estatus: json["estatus"],
        observaciones: json["observaciones"],
      );

  Map<String, dynamic> toJson() => {
        "nombres": nombres,
        "primerApellido": primerApellido,
        "segundoApellido": segundoApellido,
        "estatus": estatus,
        "observaciones": observaciones,
      };
}
