import 'package:flutter/material.dart';
import 'package:appturistainfo/pages/derechos.dart';
import 'package:appturistainfo/pages/prevenir.dart';
import 'package:appturistainfo/pages/consultas.dart';
import 'package:appturistainfo/pages/contactos.dart';
class MainTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: new Scaffold(
          body: TabBarView(
            children: <Widget>[
              Derechos(),
              Prevenir(),
              Consultas(),
              Contactos()
            ],
          ),
          bottomNavigationBar: PreferredSize(
            preferredSize: Size(60.0, 60.0),
            child: Container(
              height: 60.0,
              child: TabBar(
                labelColor: Theme.of(context).primaryColor,
                labelStyle: TextStyle(fontSize: 15.0),
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.book, size: 30.0),
                    text: 'Derechos',

                  ),
                  Tab(
                    icon: Icon(Icons.warning, size: 30.0),
                    text: 'Prevenir',
                  ),
                  Tab(
                    icon: Icon(Icons.message, size: 30.0),
                    text: 'Reclamos',
                  ),
                  Tab(
                    icon: Icon(Icons.contact_phone, size: 30.0),
                    text: 'Contacto',

                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}