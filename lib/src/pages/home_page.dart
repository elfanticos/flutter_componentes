import 'package:flutter/material.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:componentes/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    // Cargar opciones
    return FutureBuilder(
      future      : menuProvider.cargarData(),
      initialData : [],
      builder     : (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView( children: _listItems(snapshot.data,context),);
      },
    );
  
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {

    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = Column(
        children: <Widget>[
          ListTile(
            title    : Text(opt['texto']),
            leading  : getIcon(opt['icon']),
            trailing : Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
            onTap    : () {
                Navigator.pushNamed(context, opt['ruta']);
            },
          ),
          Divider(),
        ],
        );
      opciones.add(widgetTemp);
    });

    return opciones;
  }
}