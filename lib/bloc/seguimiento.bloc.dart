// import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:prospectoscc/models/listado.res.model.dart';
import 'package:prospectoscc/services/api.service.dart';

class SeguimientoBloc with ChangeNotifier {
  // bool _loading = false;
  int _paginado = 0;
  int _limite = 100;

  // void setLoading(value) {
  //   _loading = value;
  //   notifyListeners();
  // }

  // bool isLoading() {
  //   return _loading;
  // }

  // void setPagination(value) {
  //   _paginado = value;
  //   notifyListeners();
  // }

  int getPagination() {
    return _paginado;
  }

  // void setLimit(value) {
  //   _limite = value;
  //   notifyListeners();
  // }

  int getLimit() {
    return _limite;
  }

  Future<ListadoResponse> obtenerProspectos() async {
    final response = await ProspectosService()
        .obtenerProspectos(this.getPagination(), this.getLimit());
    return response;
  }
}
