import 'package:flutter/material.dart';
import 'package:appturistainfo/behavior/hidenScrollBehavior.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => new _RegistroPageState();
 }
class _RegistroPageState extends State<RegistroPage> {

  
  final _formkey =GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _email;
  String _password;

  bool _isRegistro=false;

  _registro() async{
    if(_isRegistro) return;
    setState(() {
     _isRegistro=true; 
    });

    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Registrando usuario...'),) );

    final form = _formkey.currentState;

    if(!form.validate()){
      _scaffoldKey.currentState.hideCurrentSnackBar();
      setState(() {
       _isRegistro=false; 
      });
      return;
    }

    form.save();

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
      Navigator.of(context).pushReplacementNamed('/menuDrawer');
    } catch (e) {
       _scaffoldKey.currentState.hideCurrentSnackBar();
       _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(e.message), duration: Duration(seconds: 10),
       action: SnackBarAction(
         label: 'Salir',
         onPressed: (){
           _scaffoldKey.currentState.hideCurrentSnackBar();
         },
       ),
       ));
       
       }finally {
         setState(() {
          _isRegistro = false; 
         });
       }

    }
    

     @override
  Widget build(BuildContext context) {
   return Scaffold(
    key: _scaffoldKey,
    appBar: AppBar(title: Text('Registro'),),
    body: Container(
      padding: EdgeInsets.all(20.0),
      child: ScrollConfiguration(
        behavior: HidenScrollBehavior(),
        child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              new Image.asset(
                            'assets/images/logo3.png', 
                          width: 100.0,
                          height: 250.0,
                          
                          ),
              //FlutterLogo(
                //style: FlutterLogoStyle.markOnly,
               //size: 200.0,
              //),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email', hintText: "Ingrese un correo electronico"),
                validator: (val){
                  if (val.isEmpty){
                    return 'Por favor ingrese un email valido !';
                  }else{
                    return null;
                  }
                },
                onSaved: (val){
                  setState(() {
                   _email=val; 
                  });
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password', hintText: "Ingrese su contraseña"),
                validator: (val){
                  if (val.isEmpty){
                    return 'Por favor ingrese un contraseña valida !';
                  }else{
                    return null;
                  }
                },
                onSaved: (val){
                  setState(() {
                   _password=val; 
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text('Bienvenidos a Informacion a Turistas', style: TextStyle(color: Colors.grey),),
              )
            ],
          ),
        )
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        _registro();
      },
      child: Icon(Icons.person_add),
    ),
    persistentFooterButtons: <Widget>[
      FlatButton(onPressed: (){
        Navigator.of(context).pushNamed('/login');
      },
      child: Text(' Ya estoy registrado !'),)
    ],
   );
  }

 
  
}