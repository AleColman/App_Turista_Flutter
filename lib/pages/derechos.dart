import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Derechos extends StatefulWidget {
  @override
  _DerechosState createState() => new _DerechosState();
 }
class _DerechosState extends State<Derechos> {
  static const String routeName = "/derechos";
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: AppBar(title: Text('Derechos del Consumidor'),),
     body: SafeArea(
      child: Center(
          child: ListView(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                        ],
                      ),
                    ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SectionCard(
                       new Image.asset(
                            'assets/images/libre.jpg', 
                          ),
                        Text(
                          "La libre elección del bien que se va a adquirir o del servicio qu se va a contratar.",
                          style: TextStyle(fontSize: 18.0),
                        ), 
                        () {
                      Navigator.pushNamed(context, '');
                    }
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SectionCard(
                        new Image.asset(
                            'assets/images/publi.jpg', 
                          ),
                        Text(
                          "El consumidor tiene derecho a la adecuada protección contra toda publicidad engañosa.",
                          style: TextStyle(fontSize: 18.0),
                        ), 
                        () {
                      Navigator.pushNamed(context, '');
                    }
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SectionCard(
                        new Image.asset(
                            'assets/images/publi.jpg', 
                          ),
                        Text(
                          "El consumidor tiene derecho a la adecuada protección contra toda publicidad engañosa.",
                          style: TextStyle(fontSize: 18.0),
                        ), 
                        () {
                      Navigator.pushNamed(context, '');
                    }
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SectionCard(
                        new Image.asset(
                            'assets/images/publi.jpg', 
                          ),
                        Text(
                          "El consumidor tiene derecho a la adecuada protección contra toda publicidad engañosa.",
                          style: TextStyle(fontSize: 18.0),
                        ), 
                        () {
                      Navigator.pushNamed(context, '');
                    }
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SectionCard(
                        Icon(
                          Icons.looks_two,
                          size: 80.0,
                        ),
                        Text(
                          "Recibir el producto o servicio publicitado en el tiempo, cantidad, calidad y precio prometidos.",
                          style: TextStyle(fontSize: 18.0),
                        ), 
                        () {
                     Navigator.pushNamed(context, '');
                    }
                    ),
                  ],
                ),
              ),
              Container(),
            ],
          ),
        ),
     ),
  
   );
  }
}

class SectionCard extends StatelessWidget {
  final Widget leftWidget;
  final Widget rightWidget;
  final GestureTapCallback onTap;

  SectionCard(this.leftWidget, this.rightWidget, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 4.0,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: leftWidget,
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: rightWidget,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;

  SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 24.0, color: Colors.blue),
      ),
    );
  }
}