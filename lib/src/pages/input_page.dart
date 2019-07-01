import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  String _nombre = '';
  String _email  = '';
  String _fecha  = '';
  List<String> _poderes  = ['Volar', 'Rayos X', 'Super Aliento','Super fuerza'];
  String _opcionSeleccionada = 'Volar';

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar( title: Text('Inputs de texto'), ),
      body   : ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.00, vertical: 20.00),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),

        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter    : Text('Letras ${_nombre.length}'),
        hintText   : 'Nombre de la persona',
        labelText  : 'Nombre',
        helperText : 'Sólo es el nombre',
        suffixIcon : Icon(Icons.accessibility),
        icon       : Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
         _nombre = valor; 
        });
      },
    );
  }

    Widget _crearEmail() {
    return TextField(
      // autofocus: true,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter    : Text('Letras ${_email.length}'),
        hintText   : 'Email',
        labelText  : 'Email',
        suffixIcon : Icon(Icons.alternate_email),
        icon       : Icon(Icons.email),
      ),
      onChanged: (valor) {
        setState(() {
         _email = valor; 
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText        : true,
      textCapitalization : TextCapitalization.sentences,
      decoration         : InputDecoration(
        border     : OutlineInputBorder( borderRadius: BorderRadius.circular(20.0) ),
        counter    : Text('Letras ${_email.length}'),
        hintText   : 'Password',
        labelText  : 'Password',
        suffixIcon : Icon(Icons.lock_open),
        icon       : Icon(Icons.lock),
      ),
      onChanged: (valor) {
        setState(() {
         _email = valor;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection : false,
      controller: _inputFieldDateController,
      textCapitalization         : TextCapitalization.sentences,
      decoration                 : InputDecoration(
        border     : OutlineInputBorder( borderRadius: BorderRadius.circular(20.0) ),
        counter    : Text('Letras ${_email.length}'),
        hintText   : 'Fecha de nacimiento',
        labelText  : 'Fecha de nacimiento',
        suffixIcon : Icon(Icons.perm_contact_calendar),
        icon       : Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);

      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picker = await showDatePicker(
      context     : context,
      initialDate : new DateTime.now(),
      firstDate   : new DateTime(2018),
      lastDate    : new DateTime(2025),
      locale      : Locale('es','ES')
    );

    if (picker != null) {
      setState(() {
       _fecha = picker.toString(); 
       _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  Widget _crearDropDown() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        Expanded(
          child: DropdownButton(
            value     : _opcionSeleccionada,
            items     : getOpcionesDropdown(),
            onChanged : (opt) {
              _opcionSeleccionada = opt;
            },
          ),
        )
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }
}