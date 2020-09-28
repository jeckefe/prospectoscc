import 'package:flutter/material.dart';
import 'package:prospectoscc/pages/captura.page.dart';
import 'package:prospectoscc/pages/login.page.dart';
import 'package:prospectoscc/pages/seguimiento.page.dart';
import 'package:provider/provider.dart';

import 'package:prospectoscc/bloc/home.bloc.dart';

class HomePage extends StatelessWidget {
  final List _paginas = [CapturaPage(), SeguimientoPage()];
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeBloc>(
      builder: (context, bloc, _) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Bienvenido',
            style: TextStyle(color: Colors.green),
          ),
        ),
        body: Center(
          child: _paginas[bloc.getPage()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              title: Text('Prospectos'),
              icon: Icon(Icons.assignment),
            ),
            BottomNavigationBarItem(
              title: Text('Seguimiento'),
              icon: Icon(Icons.people),
            ),
            BottomNavigationBarItem(
              title: Text('Salir'),
              icon: Icon(Icons.exit_to_app),
            )
          ],
          currentIndex: bloc.getPage(),
          elevation: 10.0,
          onTap: (index) {
            if (index != 2) {
              bloc.setPage(index);
            } else {
              bloc.setToken('');
              bloc.setLogged(false);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => LoginPage()));
            }
          },
        ),
      ),
    );
  }
}
