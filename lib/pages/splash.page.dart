import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prospectoscc/bloc/user.bloc.dart';
import 'package:prospectoscc/pages/home.page.dart';
import 'package:prospectoscc/pages/login.page.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Consumer<UserBloc>(
          builder: (context, bloc, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/cclogo.svg',
                color: Colors.white,
                height: 70,
                semanticsLabel: 'ConCredito',
              ),
              Center(
                child: Text('Prospectos',
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.green,
        ),
      ),
    );
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), _verificarSession);
    super.initState();
  }

  void _verificarSession() {
    final bloc = Provider.of<UserBloc>(context, listen: false);
    print(bloc.getLogged());
    print(bloc.getToken().isNotEmpty);
    if (bloc.getLogged() && (bloc.getToken().isNotEmpty)) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => HomePage(),
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => LoginPage(),
      ));
    }
  }
}
