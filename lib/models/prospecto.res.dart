// To parse this JSON data, do
//
//     final prospectoRes = prospectoResFromJson(jsonString);

import 'dart:convert';

ProspectoRes prospectoResFromJson(String str) =>
    ProspectoRes.fromJson(json.decode(str));

String prospectoResToJson(ProspectoRes data) => json.encode(data.toJson());

class ProspectoRes {
  ProspectoRes({
    this.error,
    this.message,
    this.data,
  });

  bool error;
  String message;
  dynamic data;

  factory ProspectoRes.fromJson(Map<String, dynamic> json) => ProspectoRes(
        error: json["error"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": data,
      };
}
