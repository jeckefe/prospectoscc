// import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:prospectoscc/models/login.req.model.dart';
import 'package:prospectoscc/models/login.res.model.dart';
import 'package:prospectoscc/services/api.service.dart';

class CapturaBloc with ChangeNotifier {
  LoginRequest request;
  String errorMessage;
  String user;
  String password;
  String errorMessagePw;
  bool loading = false;

  Future<LoginResponse> loginUsuario(LoginRequest request) async {
    setLoading(true);
    final response = await ProspectosService().loginUsuario(request);
    setLoading(false);
    return response;
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  void setMessagePw(value) {
    errorMessagePw = value;
    notifyListeners();
  }

  String getMessage() {
    return errorMessage;
  }

  String getMessagePw() {
    return errorMessagePw;
  }

  void setUser(value) {
    user = value;
    notifyListeners();
  }

  String getUser() {
    return user;
  }

  void setPassword(value) {
    password = value;
    notifyListeners();
  }

  String getPassword() {
    return password;
  }
}
