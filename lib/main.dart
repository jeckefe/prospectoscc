import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prospectoscc/bloc/captura.bloc.dart';
import 'package:prospectoscc/bloc/home.bloc.dart';
import 'package:prospectoscc/bloc/seguimiento.bloc.dart';
import 'package:prospectoscc/pages/captura.page.dart';
import 'package:prospectoscc/pages/home.page.dart';
import 'package:prospectoscc/pages/login.page.dart';
import 'package:prospectoscc/pages/seguimiento.page.dart';
import 'package:prospectoscc/pages/splash.page.dart';
import 'package:prospectoscc/services/preferencias.service.dart';
import 'package:provider/provider.dart';

import 'bloc/user.bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => new UserBloc()),
          ChangeNotifierProvider(create: (_) => new HomeBloc()),
          ChangeNotifierProvider(create: (_) => new CapturaBloc()),
          ChangeNotifierProvider(create: (_) => new SeguimientoBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ProspectosCC',
          theme: ThemeData(
            iconTheme: IconThemeData(color: Colors.green),
            accentIconTheme: IconThemeData(color: Colors.green),
            fixTextFieldOutlineLabel: true,
            primarySwatch: Colors.green,
            accentColor: Colors.green,
            inputDecorationTheme:
                InputDecorationTheme(border: InputBorder.none),
            focusColor: Colors.green,
            splashColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          routes: {
            '/': (_) => new SplashPage(),
            'login': (_) => new LoginPage(),
            'home': (_) => new HomePage(),
            'captura': (_) => new CapturaPage(),
            'seguimiento': (_) => new SeguimientoPage(),
          },
        ));
  }
}
