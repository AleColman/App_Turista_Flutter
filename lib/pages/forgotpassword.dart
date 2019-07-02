import 'package:flutter/material.dart';
import 'package:appturistainfo/behavior/hidenScrollBehavior.dart';
import 'package:firebase_auth/firebase_auth.dart';
class ForgotPasswordpage extends StatefulWidget {
  @override
  _ForgotPasswordpageState createState() => new _ForgotPasswordpageState();
 }
class _ForgotPasswordpageState extends State<ForgotPasswordpage> {

  final _formkey =GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _email;

  bool _isSendingForgotPasword=false;
  _forgotPasword() async{
    if(_isSendingForgotPasword) return;
    setState(() {
      _isSendingForgotPasword = true;
    });

        final form = _formkey.currentState;

    if(!form.validate()){
      _scaffoldKey.currentState.hideCurrentSnackBar();
      setState(() {
       _isSendingForgotPasword=false; 
      });
      return;
    }

    form.save();

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
      _scaffoldKey.currentState.hideCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: 
      Text('Se restblecio la contraseña, por favor revisa tu correo electronico...'),
      duration: Duration(seconds: 10),
      ));
      
    } catch (e) {
       _scaffoldKey.currentState.hideCurrentSnackBar();
       _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(e.message), duration: Duration(seconds: 5),
       action: SnackBarAction(
         label: 'Salir',
         onPressed: (){
           _scaffoldKey.currentState.hideCurrentSnackBar();
         },
       ),
       ));
       
       }finally {
         setState(() {
          _isSendingForgotPasword = false; 
         });
       }
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     key: _scaffoldKey,
     appBar: AppBar(title: Text('Olvide mi contrasenha'),
     ),
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
                          width: 80.0,
                          height: 150.0,
                          
                          ),
              //FlutterLogo(style: FlutterLogoStyle.markOnly, size: 100.0),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text('Por favor ingresa tu correo para poder enviarte un link para restablecer la contraseña'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
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
              )
            ],
          ),
        ),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        _forgotPasword();
      },
      child: Icon(Icons.restore),
    ),
   );

  }
}