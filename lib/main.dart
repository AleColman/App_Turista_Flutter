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
    home: Inicio(),
   ));
 }
 
 class Inicio extends StatefulWidget {
   @override
   _InicioState createState() => new _InicioState();
  }
 class _InicioState extends State<Inicio> {

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


