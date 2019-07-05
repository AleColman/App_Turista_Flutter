import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:appturistainfo/behavior/hidenScrollBehavior.dart';
import 'package:image_picker/image_picker.dart' ;

class Consultas extends StatefulWidget {
  @override
  _ConsultasState createState() => new _ConsultasState();
 }
class _ConsultasState extends State<Consultas> {

  //codigos para insertar en base de datos
  GlobalKey<ScaffoldState> _scalffoldkey = GlobalKey<ScaffoldState>();
  CollectionReference _consultasRef;
  FirebaseUser _user;
  String _nombre;
  String _documento;
  String _pais;
  String _mensaje;
  //

  File galleryFile;
  File cameraFile;
  final _formkey =GlobalKey<FormState>();
  static const String routeName = "/consultas";

  _save(){
    final formState = _formkey.currentState;
    if(!formState.validate()) return;
    formState.save();
    
  }
  
  //codigos para insertar en base de datos
  @override
  void initState(){
    super.initState();
    _setupMessagePage();
  }

  void _setupMessagePage() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
     _user = user;
     _consultasRef = Firestore.instance.collection('users').document(user.uid).collection('messages'); 
    });
  }
  //
  @override
  Widget build(BuildContext context) {

    imageSelectorGallery() async {
      galleryFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
      );
      print("Has seleccionado la imagen de la galería : "+ galleryFile.path);
      setState(() {
        
      });
    }

    imageSelectorCamara() async {
      cameraFile = await ImagePicker.pickImage(
        source: ImageSource.camera
      );
      print("Has seleccionado imagen de la cámara : "+ cameraFile.path);
      setState(() {
        
      });
    } 
   return new Scaffold(
     appBar: AppBar(title: Text('Consultas - Reclamos'),),
     body: Container(
     
       padding: EdgeInsets.all(10.0),
       child: ScrollConfiguration(
         behavior: HidenScrollBehavior(),
         child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre(s)*', hintText: 'Ingrese su nombre completo'),
                onSaved: (val){
                  setState(() {
                    _nombre = val;
                  });
                },
                   validator: (val){
                  if (val.isEmpty){
                    return 'Por favor rellene los campos';
                  }else{
                    return null;
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nro de Documento*', hintText: 'Ingrese su numero de documneto'),
                   onSaved: (val){
                  setState(() {
                    _documento = val;
                  });
                },
                   validator: (val){
                  if (val.isEmpty){
                    return 'Por favor rellene los campos';
                  }else{
                    return null;
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Pais de Origen*', hintText: 'Ingrese pais de origen'),
                   onSaved: (val){
                  setState(() {
                    _pais = val;
                  });
                },
                   validator: (val){
                  if (val.isEmpty){
                    return 'Por favor rellene los campos';
                  }else{
                    return null;
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mensaje*', hintText: 'Escriba su consulta o reclamo'),
                maxLines: 4,
                  onSaved: (val){
                  setState(() {
                    _mensaje = val;
                  });
                },
                   validator: (val){
                  if (val.isEmpty){
                    return 'Por favor rellene los campos';
                  }else{
                    return null;
                  }
                },
              ),
              Builder(
                builder: (BuildContext context){
                  return new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new RaisedButton(
                        child: new Text('Imagen de la Galeria'),
                        onPressed: imageSelectorGallery,
                      ),
                      new RaisedButton(
                        child: new Text('Imagen de la camara'),
                        onPressed: imageSelectorCamara,
                      ),
                      displaySelectedFile(galleryFile),
                      displaySelectedFile(cameraFile)
                    ],
                  );
                }
              ),
              Padding(padding: EdgeInsets.all(5.0),),
              new RaisedButton(
                child: new Text('Enviar Mensaje', style: TextStyle(color: Colors.white),),
                color: Colors.blueAccent,
                onPressed: _save,
              ),

              //Center(
                //child: _image == null 
                //? Text ('No hay imagen seleccionado')
               // : Image.file(_image),
             // ),
              //FloatingActionButton(
              //  onPressed: getImage,
              //  tooltip: 'Seleccionar imagen',
              //  child: Icon(Icons.add_a_photo),
              //)

            ],
          ),
          
         ),
         
       ),
       
     ),
   
   );
  }
  Widget displaySelectedFile(File file) {
    return new SizedBox(
      height: 350.0,
      width: 200.0,
//child: new Card(child: new Text(''+galleryFile.toString())),
//child: new Image.file(galleryFile),
      child: file == null
          ? new Text('No se selecciono nada!!')
          : new Image.file(file),
    );
  }
}


