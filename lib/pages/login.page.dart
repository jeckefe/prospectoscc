import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prospectoscc/bloc/user.bloc.dart';
import 'package:prospectoscc/pages/home.page.dart';
import 'package:prospectoscc/utils/alert.utils.dart';
import 'package:prospectoscc/widgets/button.circular.dart';
import 'package:prospectoscc/widgets/textfield.rounded.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Form(
                    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          _bannerLogin(context),
          Divider(),
          SizedBox(
            height: 20,
          ),
          Consumer<UserBloc>(
              builder: (context, bloc, _) => Container(
                    child: Column(
                      children: <Widget>[
                        TextFieldRounded(
                          onChanged: (correo) => bloc.setUser(correo),
                          errorText: bloc.getMessage(),
                          hintText: 'Correo Electronico',
                          keyboardType: TextInputType.emailAddress,
                          radius: 10,
                          isPassword: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFieldRounded(
                          errorText: bloc.getMessagePw(),
                          hintText: 'Contraseña',
                          keyboardType: TextInputType.visiblePassword,
                          radius: 10,
                          isPassword: true,
                          onChanged: (password) => bloc.setPassword(password),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: ButtonCircular(
                            onTap: () {
                              bloc.isLoading()
                                  ? CircularProgressIndicator(
                                      strokeWidth: 2,
                                      backgroundColor: Colors.white,
                                    )
                                  : _logIn(bloc);
                            },
                            width: 300,
                            height: 50,
                            text: bloc.isLoading()
                                ? CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.grey),
                                    backgroundColor: Colors.white,
                                  )
                                : Text('Ingresar',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                            radius: 30,
                            colorDecoration: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ))
        ],
      ),
    )))));
  }

  Widget _bannerLogin(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/svg/cclogo.svg',
            semanticsLabel: 'ConCredito',
            color: Colors.green,
            width: _size.height * 0.4,
          ),
          Text('Prospectos',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic)),
          SizedBox(
            height: _size.height * 0.1,
          ),
          Text('Iniciar Sesión',
              style: TextStyle(color: Colors.green, fontSize: 20))
        ],
      ),
    );
  }

  _logIn(UserBloc bloc) async {
    final response = await bloc.loginUsuario();
    if (response.error == true) {
      mostrarAlerta(context, response.message.toString());
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => HomePage(),
      ));
    }
  }
}
