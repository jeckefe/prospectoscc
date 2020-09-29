import 'package:flutter/material.dart';
import 'package:prospectoscc/bloc/captura.bloc.dart';
import 'package:prospectoscc/bloc/home.bloc.dart';
import 'package:prospectoscc/pages/login.page.dart';
import 'package:prospectoscc/utils/alert.utils.dart';
import 'package:prospectoscc/widgets/button.circular.dart';
import 'package:prospectoscc/widgets/textfield.rounded.dart';
import 'package:provider/provider.dart';

class CapturaPage extends StatefulWidget {
  @override
  _CapturaPageState createState() => _CapturaPageState();
}

class _CapturaPageState extends State<CapturaPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Form(
                child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Divider(),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: <Widget>[
                _formProspecto(),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                _rowBotones(),
                SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    ))));
  }

  Widget _formProspecto() {
    return Container(
      child: Consumer<CapturaBloc>(
          builder: (context, bloc, _) => Column(
                children: [
                  TextFieldRounded(
                    onChanged: (value) => bloc.setNombres(value),
                    // errorText: bloc.getMessage(),
                    hintText: 'Nombre(s)',
                    keyboardType: TextInputType.name,
                    radius: 10,
                    isPassword: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldRounded(
                    // errorText: bloc.getMessagePw(),
                    hintText: 'Apellido paterno',
                    keyboardType: TextInputType.name,
                    radius: 10,
                    isPassword: false,
                    onChanged: (value) => bloc.setPrimerApellido(value),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldRounded(
                    // errorText: bloc.getMessagePw(),
                    hintText: 'Apellido materno',
                    keyboardType: TextInputType.name,
                    radius: 10,
                    isPassword: false,
                    onChanged: (value) => bloc.setSegundoApellido(value),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldRounded(
                    // errorText: bloc.getMessagePw(),
                    hintText: 'Calle',
                    keyboardType: TextInputType.streetAddress,
                    radius: 10,
                    isPassword: false,
                    onChanged: (value) => bloc.setCalle(value),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldRounded(
                    // errorText: bloc.getMessagePw(),
                    hintText: 'Numero interior',
                    keyboardType: TextInputType.text,
                    radius: 10,
                    isPassword: false,
                    onChanged: (value) => bloc.setNumeroInterior(value),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldRounded(
                    // errorText: bloc.getMessagePw(),
                    hintText: 'Colonia',
                    keyboardType: TextInputType.text,
                    radius: 10,
                    isPassword: false,
                    onChanged: (value) => bloc.setColonia(value),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldRounded(
                    // errorText: bloc.getMessagePw(),
                    hintText: 'Codigo postal',
                    keyboardType: TextInputType.number,
                    radius: 10,
                    isPassword: false,
                    onChanged: (value) => bloc.setCodigoPostal,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldRounded(
                    // errorText: bloc.getMessagePw(),
                    hintText: 'Telefono',
                    keyboardType: TextInputType.phone,
                    radius: 10,
                    isPassword: false,
                    onChanged: (value) => bloc.setTelefono(value),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldRounded(
                    // errorText: bloc.getMessagePw(),
                    hintText: 'RFC',
                    keyboardType: TextInputType.phone,
                    radius: 10,
                    isPassword: false,
                    onChanged: (value) => bloc.setRfc(value),
                  ),
                ],
              )),
    );
  }

  Widget _rowBotones() {
    return Container(
      child: Consumer<CapturaBloc>(
        builder: (context, bloc, _) => Row(
          children: [
            ButtonCircular(
              onTap: () => _registrarProspecto(bloc),
              width: 300,
              height: 50,
              text: bloc.isLoading()
                  ? CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                      backgroundColor: Colors.white,
                    )
                  : Text('Enviar',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
              radius: 30,
              colorDecoration: Colors.green,
              fontSize: 20,
            ),
            SizedBox(
              width: 20,
            ),
            ButtonCircular(
              onTap: () {},
              width: 300,
              height: 50,
              text: Text('Cancelar',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              radius: 30,
              colorDecoration: Colors.red[400],
              fontSize: 20,
            ),
          ],
        ),
      ),
    );
  }

  _registrarProspecto(CapturaBloc bloc) async {
    bloc.setLoading(true);
    final response = await bloc.registrarProspecto();

    if (response.error && !bloc.isLogged) {
      mostrarAlerta(context, response.message.toString());
      bloc.setLoading(false);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => LoginPage(),
      ));
    } else if (!response.error && bloc.isLogged) {
      bloc.setLoading(false);
      mostrarAlerta(context, response.message.toString());
      Future.delayed(Duration(milliseconds: 3000), () {
        Provider.of<HomeBloc>(context, listen: false).setPage(1);
      });
    } else if (response.error && bloc.isLogged) {
      bloc.setLoading(false);
      mostrarAlerta(context, response.message.toString());
    }
  }
}
