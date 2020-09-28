// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.error,
    this.message,
    this.data,
  });
  bool error;
  String message;
  Data data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        error: json["error"],
        message: json["message"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.idUsuario,
    this.email,
    this.nombres,
    this.token,
  });

  int idUsuario;
  String email;
  String nombres;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idUsuario: json["idUsuario"],
        email: json["email"],
        nombres: json["nombres"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "idUsuario": idUsuario,
        "email": email,
        "nombres": nombres,
        "token": token,
      };
}
