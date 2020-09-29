import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prospectoscc/models/listado.res.model.dart';
import 'package:prospectoscc/models/login.req.model.dart';
import 'package:prospectoscc/models/login.res.model.dart';
import 'package:prospectoscc/models/prospecto.req.dart';
import 'package:prospectoscc/models/prospecto.res.dart';
import 'package:prospectoscc/services/preferencias.service.dart';

class ProspectosService {
  String _apiProspectosCC = 'http://67.205.156.112:3000';
  PreferenciasUsuario _prefs = PreferenciasUsuario();

  Future<LoginResponse> loginUsuario(LoginRequest request) async {
    final request2 = json.encode(request);
    final url = '$_apiProspectosCC/app/iniciar';
    final resp = await http.post(url,
        body: request2, headers: {"Content-type": "application/json"});

    final loginResponse = loginResponseFromJson(resp.body);
    if (loginResponse.error != true) {
      _prefs.setLogged(true);
      _prefs.setToken(loginResponse.data.token);
    } else {
      _prefs.setToken('');
      _prefs.setLogged(false);
    }
    return loginResponse;
  }

  Future<ProspectoRes> registrarProspecto(ProspectoRequest request) async {
    final request2 = json.encode(request);
    final url = '$_apiProspectosCC/app/prospectos';
    final resp = await http.post(url, body: request2, headers: {
      "Content-type": "application/json",
      "Authorization": 'Bearer ${_prefs.getToken()}'
    });

    final response = prospectoResFromJson(resp.body);
    if (response.error && resp.statusCode == 403) {
      _prefs.setToken('');
      _prefs.setLogged(false);
    } else if (response.error && resp.statusCode == 422) {
      response.message =
          'Información incompleta, favor de validar los campos capturados';
      response.data = null;
    }
    return response;
  }

  Future<ListadoResponse> obtenerProspectos(paginado, limit) async {
    final url = '$_apiProspectosCC/app/prospectos?page=$paginado&limit=$limit';
    final resp = await http.get(
      url,
      headers: {"Authorization": 'Bearer ${_prefs.getToken()}'},
    );

    final response = listadoResponseFromJson(resp.body);
    if (response.error && resp.statusCode == 403) {
      _prefs.setToken('');
      _prefs.setLogged(false);
    } else if (response.error && resp.statusCode == 422) {
      response.message =
          'Información incompleta, favor de validar los campos capturados';
      response.data = null;
    }
    return response;
  }
}
