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
     body: Center(
       child: Text('Seccion de Prevenir a cargar'),
     ),
  
   );
  }
}