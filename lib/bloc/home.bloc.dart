// import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:prospectoscc/models/login.req.model.dart';
import 'package:prospectoscc/services/preferencias.service.dart';

class HomeBloc with ChangeNotifier {
  PreferenciasUsuario _prefs = PreferenciasUsuario();
  LoginRequest request;
  bool loading = false;
  String token;
  String titulo = 'Bienvenido';
  int index = 0;

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  void setPage(value) {
    index = value;
    notifyListeners();
  }

  int getPage() {
    return index;
  }

  void setToken(value) {
    _prefs.setToken(value);
    notifyListeners();
  }

  void setLogged(value) {
    _prefs.setLogged(value);
    notifyListeners();
  }

  String getTitle() {
    return titulo;
  }

  void setTitle(value) {
    titulo = value;
    notifyListeners();
  }
}
