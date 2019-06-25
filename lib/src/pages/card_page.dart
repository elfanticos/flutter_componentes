import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.00),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
           _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.00)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('Soy el título de está tarjeta'),
            subtitle: Text('Este texto es uno de prueba que quiero mostrarle para que vean como se muestra en el card'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final Widget card = Container(
                    child: Column(
                      children: <Widget>[
                        FadeInImage( 
                          image: NetworkImage('https://images.pexels.com/photos/414171/pexels-photo-414171.jpeg?auto=compress&cs=tinysrgb&h=650&w=940'),
                          placeholder: AssetImage('assets/jar-loading.gif'),
                          fadeInDuration: Duration(milliseconds: 200),
                          height: 300.0,
                          fit: BoxFit.cover,
                        ),
                        // Image(
                          // image: AssetImage('assets/paisaje_hd.jpg'), 
                          // image: NetworkImage('https://images.pexels.com/photos/414171/pexels-photo-414171.jpeg?auto=compress&cs=tinysrgb&h=650&w=940'),
                        // ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text('No tengo idea de que poner'),
                        ),
                      ],
                    ),
                  );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.00),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0),
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}