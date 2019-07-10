import 'package:flutter/material.dart';

class Prevenir extends StatefulWidget {
  @override
  _PrevenirState createState() => new _PrevenirState();
 }
class _PrevenirState extends State<Prevenir> {
  static const String routeName = "/prevenir";
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: AppBar(title: Text('Precauciones al comprar'),),
     body: Container(
       child: new Column(
         children: <Widget>[
           new Row(
             children: <Widget>[
               
               new Image.asset(
                            'assets/images/logo3.png', 
                          width: 100.0,
                          height: 250.0,
                          
                          ),
               new Text('esto es una prueba de demo asdfasdsf'),
             ],

           )
         ],
       )
     ),
  
   );
  }
}