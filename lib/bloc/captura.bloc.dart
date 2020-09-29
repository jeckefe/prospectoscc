// import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:prospectoscc/models/prospecto.req.dart';
import 'package:prospectoscc/models/prospecto.res.dart';
import 'package:prospectoscc/services/api.service.dart';
import 'package:prospectoscc/services/preferencias.service.dart';

class CapturaBloc with ChangeNotifier {
  PreferenciasUsuario _prefs = PreferenciasUsuario();
  bool _loading = false;
  String _nombres;
  String _primerApellido;
  String _segundoApellido = '';
  String _calle;
  String _colonia;
  String _telefono;
  String _rfc;
  String _numeroInterior;
  int _codigoPostal = 0;
  int _estatus = 1;
  int _index = 1;

  bool isLoading() => _loading;

  void setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  String getNombres() => _nombres;

  void setNombres(String nombres) {
    _nombres = nombres;
    notifyListeners();
  }

  String getPrimerApellido() => _primerApellido;

  void setPrimerApellido(String primerApellido) {
    _primerApellido = primerApellido;
    notifyListeners();
  }

  String getSegundoApellido() => _segundoApellido;

  void setSegundoApellido(String segundoApellido) {
    _segundoApellido = segundoApellido;
    notifyListeners();
  }

  String getCalle() => _calle;

  void setCalle(String calle) {
    _calle = calle;
    notifyListeners();
  }

  String getColonia() => _colonia;

  void setColonia(String colonia) {
    _colonia = colonia;
    notifyListeners();
  }

  String getTelefono() => _telefono;

  void setTelefono(String telefono) {
    _telefono = telefono;
    notifyListeners();
  }

  String getRfc() => _rfc;

  void setRfc(String rfc) {
    _rfc = rfc;
    notifyListeners();
  }

  int getCodigoPostal() => _codigoPostal;

  void setCodigoPostal(int codigoPostal) {
    _codigoPostal = codigoPostal;
    notifyListeners();
  }

  int getEstatus() => _estatus;

  bool get isLogged => _prefs.getLogged();

  void setIsLogged(bool isLogged) {
    _prefs.setLogged(isLogged);
    notifyListeners();
  }

  String getNumeroInterior() => _numeroInterior;

  void setNumeroInterior(String numeroInterior) {
    _numeroInterior = numeroInterior;
    notifyListeners();
  }

  void setPage(value) {
    _index = value;
    notifyListeners();
  }

  int getPage() {
    return _index;
  }

  void setBlocEmpty(value) {
    _nombres = value;
    _primerApellido = value;
    _segundoApellido = value;
    _calle = value;
    _colonia = value;
    _rfc = value;
    _telefono = value;
    _codigoPostal = 0;
    notifyListeners();
  }

  Future<ProspectoRes> registrarProspecto() async {
    this.setLoading(true);
    final request = ProspectoRequest();
    request.nombres = this.getNombres();
    request.primerApellido = this.getPrimerApellido();
    request.segundoApellido = this.getSegundoApellido();
    request.numeroInterior = this.getNumeroInterior();
    request.calle = this.getCalle();
    request.colonia = this.getColonia();
    request.rfc = this.getRfc();
    request.telefono = this.getTelefono();
    request.codigoPostal = this.getCodigoPostal();
    request.estatus = this.getEstatus();

    final response = await ProspectosService().registrarProspecto(request);
    this.setLoading(false);
    return response;
  }
}
