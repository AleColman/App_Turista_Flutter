import 'package:flutter/material.dart';


class MenuDrawer extends StatefulWidget {
  @override
  _MenuDrawerState createState() => new _MenuDrawerState();
 }
class _MenuDrawerState extends State<MenuDrawer> {
  Drawer _getDrawer(BuildContext context){

    //var header = new DrawerHeader( 
    //  child: new Text('Información al Turista'),
    //);
    var info = new AboutListTile(
      
      child: new Text('Información App'),
      applicationVersion: 'v1.0.0',
      applicationName: 'Info Turistas',
      applicationIcon: Icon(Icons.favorite),
      icon: Icon(Icons.info),
    );
    ListTile _getItem(Icon icon, String descripcion, String route){
      return new ListTile(
        leading: icon,
        title: new Text(descripcion),
        onTap: (){
          setState(() {
          Navigator.of(context).pushNamed(route); 
        });
      },
    );
  }

    ListView listView = new ListView(
      
      children: <Widget>[
        //header,  
         new Image.asset(
                            'assets/images/logo3.png', 
                          width: 80.0,
                          height: 150.0,
                          
                          ),
      _getItem(new Icon(Icons.home), 'Pagina Principal', "/menuDrawer"),
      _getItem(new Icon(Icons.book), 'Derechos del Consumidor', "/derechos"),
      _getItem(new Icon(Icons.warning), 'Prevenir', "/prevenir"),
      _getItem(new Icon(Icons.message), 'Consultas - Reclamos', "/consultas"),
      _getItem(new Icon(Icons.message), 'Historial de Chat', "/mensajes"),
      _getItem(new Icon(Icons.phone), 'Contactos', "/contactos"),
      info
    ],
  );
    return new Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     floatingActionButton: FloatingActionButton(
       onPressed:(){
          setState(() {
           Navigator.of(context).pushNamed("/consultas"); 
          });
       },
       child: Icon(Icons.message),

     ),
     appBar: new AppBar(
       title: Text('Principal'),
     ),
     drawer: _getDrawer(context),
     body: Container(
       padding: EdgeInsets.all(5.0),
       child: Form(
         child: ListView(
           children: <Widget>[
              new Image.asset(
                   'assets/images/puente.jpg', 
                    //width: 80.0,
                     //height: 250.0,            
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text('Ciudad del Este - Py', style: TextStyle(color: Colors.black), textAlign: TextAlign.center,),
              ), 
               new ListTile(title: Text('Estar bien informado es la mejor prevención',style: TextStyle(fontWeight: FontWeight.bold),), leading: new Icon(Icons.check_box, color: Colors.black),),
                //Padding(padding: EdgeInsets.symmetric(vertical: 20.0),
                
                //),
                new ListTile(title: Text('infórmese sobre sus derechos',style: TextStyle(fontWeight: FontWeight.bold),), leading: new Icon(Icons.check_box, color: Colors.black),),
                //Padding(padding: EdgeInsets.symmetric(vertical: 20.0),
                
               // ),
                new ListTile(title: Text('Realice sus Consultas y Reclamos ',style: TextStyle(fontWeight: FontWeight.bold),), leading: new Icon(Icons.check_box, color: Colors.black),),
                //Padding(padding: EdgeInsets.symmetric(vertical: 10.0),
                
                //),
                new ListTile(title: Text('"USTED NO ESTA SOLO , DEFIENDA SUS DERECHOS"',style: TextStyle(fontWeight: FontWeight.bold),), leading: new Icon(Icons.check_box, color: Colors.black),),
                //Padding(padding: EdgeInsets.symmetric(vertical: 20.0),
                
                //),
           ],
         ),
       ),
     ),
     );
   
  }
}