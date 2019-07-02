import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Contactos extends StatefulWidget {
  @override
  _ContactosState createState() => new _ContactosState();
 }
class _ContactosState extends State<Contactos> {

  _salir() async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed('/registro');
  }
  static const String routeName = "/contactos";
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: AppBar(title: Text('Contáctenos'),),

     body: Container(
        padding: EdgeInsets.all(5.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              new Image.asset(
                            'assets/images/img1.png', 
                          width: 100.0,
                          height: 250.0,
                          
                          ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.0),
                child: Text('Defensa del Consumidor - CDE - PY', style: TextStyle(color: Colors.black), textAlign: TextAlign.center,),
              ), 
               new ListTile(title: Text('(061) 500 - 805'), leading: new Icon(Icons.phone, color: Colors.black,),),
               new ListTile(title: Text('07:00hs - 13:00hs.'), leading: new Icon(Icons.access_time, color: Colors.black,),),
               new ListTile(title: Text('defensadelconsumidor_mcde@hotmail.com'), leading: new Icon(Icons.mail_outline, color: Colors.black,),),
               new ListTile(title: Text('Avda. Pioneros del Este, frente a Copaco'), leading: new Icon(Icons.location_on, color: Colors.black,),),
                
            ],
            
          ),
          
        ),
       //child: FlatButton(
         //onPressed: (){
         //  _salir();
       // },
        // child: Row(
         // mainAxisAlignment: MainAxisAlignment.center,
         //  children: <Widget>[
          //   Text('Cerrar Sesión', style: TextStyle(color: Colors.redAccent, fontSize: 20.0),),
          //  Spacer(),
          //   Icon(Icons.exit_to_app, color: Colors.redAccent, size: 30.0,)
         // ],
        // ),
       //),
     ),
       floatingActionButton: FloatingActionButton(
      onPressed: (){
        _salir();
      },
      child: Icon(Icons.close),
    ),  
   );
  }
}
