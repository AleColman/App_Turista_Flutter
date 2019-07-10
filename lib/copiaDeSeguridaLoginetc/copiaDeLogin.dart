import 'dart:async';

import 'package:flutter/material.dart';
import 'package:appturistainfo/behavior/hidenScrollBehavior.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appturistainfo/const.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:appturistainfo/main.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
 }
class _LoginPageState extends State<LoginPage> {
  
  final _formkey =GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  //
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences prefs;
  FirebaseUser currentUser;
  
  //
  String _email;
  String _password;
  bool _isLoginIn=false;
  //
  bool isLoading = false;

  @override
  void initState(){
    super.initState();
    isSignedId();
  }
  void isSignedId()async{
    this.setState((){
      isLoading=true;
    });
    prefs = await SharedPreferences.getInstance();
    //_isLoginIn = await .isSignedId();
  }
  //
  
    _login() async{
    if(_isLoginIn){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen(currentUserId: prefs.getString('id'))),
      );
    } //return;
    this.setState(() {
     _isLoginIn=false; 
    });
    //
    Future<Null> handleSignIn() async {
    prefs = await SharedPreferences.getInstance();

    this.setState(() {
      isLoading = true;
    });

    //GoogleSignInAccount googleUser = await googleSignIn.signIn();
    //GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    //final AuthCredential credential = GoogleAuthProvider.getCredential(
     // accessToken: googleAuth.accessToken,
      //idToken: googleAuth.idToken,
    //);

    FirebaseUser firebaseUser = await firebaseAuth.signInWithEmailAndPassword(email: null, password: null);

    if (firebaseUser != null) {
      // Check is already sign up
      final QuerySnapshot result =
          await Firestore.instance.collection('users').where('id', isEqualTo: firebaseUser.uid).getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        // Update data to server if new user
        Firestore.instance
            .collection('users')
            .document(firebaseUser.uid)
            .setData({'nickname': firebaseUser.displayName, 'photoUrl': firebaseUser.photoUrl, 'id': firebaseUser.uid});

        // Write data to local
        currentUser = firebaseUser;
        await prefs.setString('id', currentUser.uid);
        await prefs.setString('nickname', currentUser.displayName);
        await prefs.setString('photoUrl', currentUser.photoUrl);
      } else {
        // Write data to local
        await prefs.setString('id', documents[0]['id']);
        await prefs.setString('nickname', documents[0]['nickname']);
        await prefs.setString('photoUrl', documents[0]['photoUrl']);
        await prefs.setString('aboutMe', documents[0]['aboutMe']);
      }
      Fluttertoast.showToast(msg: "Sign in success");
      this.setState(() {
        isLoading = false;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScreen(
                  currentUserId: firebaseUser.uid,
                )),
      );
    } else {
      Fluttertoast.showToast(msg: "Sign in fail");
      this.setState(() {
        isLoading = false;
      });
    }
  }
    //
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Iniciando Sesion...'),) );

    final form = _formkey.currentState;

    if(!form.validate()){
      _scaffoldKey.currentState.hideCurrentSnackBar();
      setState(() {
       _isLoginIn=false; 
      });
      return;
    }

    form.save();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
     
      Navigator.of(context).pop();

      Navigator.of(context).pushReplacementNamed('/menuDrawer');
      //

      //
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
          _isLoginIn = false; 
         });
       }

    }
  
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     key: _scaffoldKey,
     appBar: AppBar(title: Text('Iniciar Sesión'),),
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
              ),
              FlatButton(child: Text('Olvide mi contraseña !', style: TextStyle(decoration: TextDecoration.underline),),
              onPressed: (){
              Navigator.of(context).pushNamed('/forgotpassword');
              }, textColor: Colors.blueGrey,)
            ],
          ),
        )
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        _login();
      },
      child: Icon(Icons.account_circle),
    ),
    persistentFooterButtons: <Widget>[
      FlatButton(onPressed: (){
        Navigator.of(context).pop();
      },
      child: Text(' No tengo una cuenta !'),)
    ],
   );
  }
}