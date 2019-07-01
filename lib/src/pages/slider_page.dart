import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valor_Slider = 0.0;
  bool _bloquearCheck  = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Slider'),
       ),
       body: Container(
         padding: EdgeInsets.only(top: 50.0),
         child: Column(
           children: <Widget>[
             _crearSlider(),
             _checkBox(),
             Divider(),
             _crearSwitch(),
             Expanded(
               child: _crearImagen(),
               )
           ],
         ),
       ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor : Colors.indigoAccent,
      label       : 'Tamaño de la imagen',
      divisions   : 20,
      value       : _valor_Slider,
      max         : 400,
      min         : 0,
      onChanged   : _bloquearCheck ? null : (valor) {
        setState(() {
          _valor_Slider = valor;
        });
      },
    );
  }

  Widget _checkBox() {
    // return Checkbox(
    //   value     : _bloquearCheck,
    //   onChanged : (valor) {
    //     setState(() {
    //      _bloquearCheck = valor; 
    //     });
    //   },
    // );
    return CheckboxListTile(
      title     : Text('Bloquear slider'),
      value     : _bloquearCheck,
      onChanged : (valor) {
        setState(() {
         _bloquearCheck = valor; 
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title     : Text('Bloquear slider'),
      value     : _bloquearCheck,
      onChanged : (valor) {
        setState(() {
         _bloquearCheck = valor; 
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image : NetworkImage('https://i.blogs.es/aef8b3/savage-builds-iron-man/450_1000.jpeg'),
      width : _valor_Slider,
      fit   : BoxFit.contain,
    );
  }
}