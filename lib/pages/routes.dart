import 'package:flutter/material.dart';
import 'package:appturistainfo/pages/login.dart';
import 'package:appturistainfo/pages/registro.dart';
import 'package:appturistainfo/pages/forgotpassword.dart';
import 'package:appturistainfo/pages/mainTabs.dart';
import 'package:appturistainfo/pages/menuDrawer.dart';
import 'package:appturistainfo/pages/derechos.dart';
import 'package:appturistainfo/pages/prevenir.dart';
import 'package:appturistainfo/pages/consultas.dart';
import 'package:appturistainfo/pages/contactos.dart';
Map<String, WidgetBuilder> builAppRoutes(){
  return{
    '/login': (BuildContext context) =>  LoginPage(),
    '/registro': (BuildContext context) =>  RegistroPage(),
    '/forgotpassword': (BuildContext context) =>  ForgotPasswordpage(),
    '/maintabs': (BuildContext context) =>  MainTabs(),
    '/menuDrawer': (BuildContext context) =>  MenuDrawer(),
    '/derechos': (BuildContext context) =>  Derechos(),
    '/prevenir': (BuildContext context) =>  Prevenir(),
    '/consultas': (BuildContext context) =>  Consultas(),
    '/contactos': (BuildContext context) =>  Contactos(),

  };
}