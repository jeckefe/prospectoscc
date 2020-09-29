import 'package:flutter/material.dart';
import 'package:prospectoscc/bloc/seguimiento.bloc.dart';
import 'package:prospectoscc/models/listado.res.model.dart';
import 'package:prospectoscc/widgets/cards.circular.dart';
import 'package:provider/provider.dart';

class SeguimientoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<SeguimientoBloc>(
      builder: (context, bloc, _) => _obtenerProspectos(bloc),
    ));
  }

  Widget _obtenerProspectos(SeguimientoBloc bloc) {
    return FutureBuilder(
      future: bloc.obtenerProspectos(),
      builder: (BuildContext context, AsyncSnapshot<ListadoResponse> snapShot) {
        if (snapShot.hasData) {
          final prospectos = snapShot.data;
          print('Total de elementos ${prospectos.data.length}');
          return ListView.builder(
            itemCount: prospectos.data.length,
            itemBuilder: (context, i) =>
                _crearCard(context, prospectos.data[i]),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
              backgroundColor: Colors.green[200],
            ),
          );
        }
      },
    );
  }

  Widget _crearCard(BuildContext context, Datum prospecto) {
    var icon;
    print(prospecto);
    if (prospecto.estatus == 'Enviado') {
      icon = Icons.send;
    } else if (prospecto.estatus == 'Rechazado') {
      icon = Icons.cancel;
    } else {
      icon = Icons.check;
    }
    final title =
        '${prospecto.nombres} ${prospecto.primerApellido} ${prospecto.segundoApellido}';
    return CardCircular(
      title: Text(title),
      estatus: Text(prospecto.estatus),
      observations: Text(prospecto.observaciones != ''
          ? prospecto.observaciones
          : 'Sin observaciones'),
      icon: icon,
    );
  }
}
