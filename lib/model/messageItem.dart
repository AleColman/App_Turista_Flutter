
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageItem {
  String id;
  String nombre = '';
  String documento = '';
  String pais = '';
  String mensaje = '';
  String imagen = '';
  String posicion = '';

  MessageItem(this.nombre,this.documento, this.pais, this.mensaje, this.imagen, this.posicion);

  MessageItem.from(DocumentSnapshot snapshot):
  id = snapshot.documentID,
  nombre = snapshot['nombre'],
  documento = snapshot['documento'],
  pais = snapshot['pais'],
  mensaje = snapshot['mensaje'],
  imagen = snapshot['imagen'],
  posicion = snapshot['posicion'];

  Map<String, dynamic> toJson(){
    return{
      'nombre': nombre,
      'documento': documento,
      'pais': pais,
      'mensaje': mensaje,
      'imagen': imagen,
      'posicion': posicion,
    };
  }
}