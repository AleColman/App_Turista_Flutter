import 'package:flutter/material.dart';

import 'package:appturistainfo/behavior/hidenScrollBehavior.dart';

class AddMessageAlert extends StatefulWidget {
  @override
  _AddMessageAlertState createState() => new _AddMessageAlertState();
 }
class _AddMessageAlertState extends State<AddMessageAlert> {
  
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _nombre;
  String _documento;

  _save(){
    final formState = _formkey.currentState;
    if(!formState.validate()) return;
    formState.save();
    
  }
  
  @override
  Widget build(BuildContext context) {
   return AlertDialog(
     title: Text('Enviar Mensaje'),
     contentPadding: EdgeInsets.all(5.0),
     content: Container(
       child: ScrollConfiguration(
         behavior: HidenScrollBehavior(),
       child: Form(
         key: _formkey,
         child: Flex(
           direction: Axis.vertical,
           mainAxisSize: MainAxisSize.max,
           children: <Widget>[
             TextFormField(
               decoration: InputDecoration(labelText: 'Nombre(s)*'),
             ),
              TextFormField(
               decoration: InputDecoration(labelText: 'Nro de Documento*'),
             ),
             TextFormField(
               decoration: InputDecoration(labelText: 'Pais de origen*'),
             ),
             TextFormField(
               decoration: InputDecoration(labelText: 'Mensaje*'),
               
             ),
           ],
         ),
       ),
       ),
     ),
     actions: <Widget>[
       FlatButton(
         onPressed: (){

         },
         textColor: Colors.blueGrey,
         child: Text('Cancel'),
       ),
        RaisedButton(
         onPressed: (){
           _save();
         },
         color: Theme.of(context).primaryColor,
         textColor: Colors.white,
         child: Text('Enviar'),
       ),
     ],
   );
  }
}