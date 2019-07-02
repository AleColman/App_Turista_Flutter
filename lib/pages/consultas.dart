import 'dart:io';
import 'package:flutter/material.dart';
import 'package:appturistainfo/behavior/hidenScrollBehavior.dart';
import 'package:image_picker/image_picker.dart' ;

class Consultas extends StatefulWidget {
  @override
  _ConsultasState createState() => new _ConsultasState();
 }
class _ConsultasState extends State<Consultas> {

  
  File galleryFile;
  File cameraFile;

  //File _image;

  //Future getImage() async {
    //var image = await ImagePicker.pickImage(source: ImageSource.camera);
    //setState(() {
    // _image = image; 
   // });
 // }

  final _formkey =GlobalKey<FormState>();
 
  static const String routeName = "/consultas";
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
                onPressed: (){
                  
                },
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
      height: 200.0,
      width: 80.0,
//child: new Card(child: new Text(''+galleryFile.toString())),
//child: new Image.file(galleryFile),
      child: file == null
          ? new Text('No se selecciono nada!!')
          : new Image.file(file),
    );
  }
}


