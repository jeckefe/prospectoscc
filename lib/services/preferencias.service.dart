import 'package:shared_preferences/shared_preferences.dart';

/*
  Recordar instalar el paquete de:
    shared_preferences:
  Inicializar en el main
    final prefs = new PreferenciasUsuario();
    await prefs.initPrefs();
    
    Recuerden que el main() debe de ser async {...
*/

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  /// Obtener de token en shared preferences
  String getToken() => _prefs.getString('token') ?? '';

  /// Guardar token en shared preferences
  void setToken(String value) {
    _prefs.setString('token', value);
  }

  /// Obtener el estado si el usuario esta logueado
  bool getLogged() => _prefs.getBool('isLogged') ?? false;

  /// Guardar el estado de si el usuario se logueo exitosamente
  void setLogged(bool value) {
    _prefs.setBool('isLogged', value);
  }

  /// Obtener la ultima pagina visitada al minimizar la app
  String getUltimaPagina() => _prefs.getString('ultimaPagina') ?? 'login';

  /// Guardar ultima pagina visitada
  void setUltimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}
