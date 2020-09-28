// import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:prospectoscc/models/login.req.model.dart';
import 'package:prospectoscc/services/preferencias.service.dart';

class HomeBloc with ChangeNotifier {
  PreferenciasUsuario _prefs = PreferenciasUsuario();
  LoginRequest request;
  bool loading = false;
  String token;
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
    _prefs.token = value;
  }

  void setLogged(value) {
    _prefs.isLogged = value;
  }
}
