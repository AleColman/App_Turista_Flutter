import 'package:flutter/material.dart';

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
     body: Center(
       child: Text('Seccion de derechos a cargar'),
     ),
  
   );
  }
}