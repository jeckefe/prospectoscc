import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prospectoscc/models/login.req.model.dart';
import 'package:prospectoscc/models/login.res.model.dart';
import 'package:prospectoscc/services/preferencias.service.dart';

class ProspectosService {
  String _apiProspectosCC = 'http://67.205.156.112:3000';
  PreferenciasUsuario _prefs = PreferenciasUsuario();

  Future<LoginResponse> loginUsuario(LoginRequest request) async {
    final request2 = json.encode(request);
    final url = '$_apiProspectosCC/app/iniciar';
    final resp = await http.post(url,
        body: request2, headers: {"Content-type": "application/json"});
    print(resp.body);

    final loginResponse = loginResponseFromJson(resp.body);
    if (loginResponse.error != true) {
      _prefs.token = loginResponse.data.token;
      _prefs.isLogged = true;
    } else {
      _prefs.token = null;
      _prefs.isLogged = false;
    }
    return loginResponse;
  }
}
