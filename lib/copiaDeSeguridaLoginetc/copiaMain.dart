import 'dart:async';

import 'package:flutter/material.dart';
import 'package:appturistainfo/pages/registro.dart';
import 'package:appturistainfo/pages/routes.dart';
import 'package:appturistainfo/tema.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:appturistainfo/pages/mainTabs.dart';
import 'package:appturistainfo/pages/menuDrawer.dart';


 void  main() {
   runApp(new MaterialApp(
    home: Inicio(currentUserId: null,),
   ));
 }
 
 class Inicio extends StatefulWidget {
   //
   final String currentUserId;
   Inicio({Key key, @required this.currentUserId}) : super(key : key);
   //
   @override
   _InicioState createState() => new _InicioState(currentUserId: currentUserId);
  }
 class _InicioState extends State<Inicio> {
   //
   _InicioState({Key key, @required this.currentUserId});
   final String currentUserId;
   
   //
   Widget _rootPage = RegistroPage();

   Future<Widget> getRootPage() async => 
   await FirebaseAuth.instance.currentUser() == null
          ? RegistroPage()
          : MenuDrawer();
         // : MainTabs();

    @override
    initState() {
    
    super.initState();
    getRootPage().then((Widget page){
      setState(() {
       _rootPage = page; 
      });
    });
  }
   @override
   Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagina de Inicio',
      home: _rootPage,
      routes: builAppRoutes(),
      theme: builAppTema(),
    );
   }
 }


