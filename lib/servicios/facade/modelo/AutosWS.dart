import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

/*class Estado {
  static const String vendido = 'VENDIDO';
  static const String disponible = 'DISPONIBLE';
  static const String reparacion = 'REPARACION';
}*/

class AutosWS {
  String modelo = '';
  String external_id = '';
  String placa = '';
  String color = '';
  //String duenio = '';
  String foto = '';
  int anioFabricacion = 0;
  String nombre_marca = '';
  double precio = 0.0;
  int kilometraje = 0;
  //String estado = Estado.disponible;
  AutosWS();

  AutosWS.fromMap(Map<dynamic, dynamic> mapa){
    modelo = mapa ['modelo'];
    external_id = mapa ['external_id'];
    foto = mapa ['foto'];
    placa = mapa ['placa'];
    //duenio = mapa ['duenio'];
    color = mapa ['color'];
    nombre_marca = mapa ['marca']['nombre'];
    precio = double.parse(mapa ['precio'].toString());
    kilometraje = int.parse(mapa ['kilometraje'].toString());
    anioFabricacion = int.parse(mapa ['anioFabricacion'].toString());

    /*if (mapa['estado'] != null) {
      if (mapa['estado'] == Estado.vendido ||
          mapa['estado'] == Estado.disponible ||
          mapa['estado'] == Estado.reparacion) {
        estado = mapa['estado'];
      }
    }*/

  }

  static Map<String, dynamic> toMap(AutosWS model) =>
      <String, dynamic> {
      "modelo": model.modelo,
        "external_id": model.external_id,
        "precio": model.precio,
        "anioFabricacion": model.anioFabricacion,
        "marca": model.nombre_marca,
        "placa": model.placa,
        "kilometraje": model.kilometraje,
        "color": model.color
      };

  static String serialize(AutosWS model) =>
      json.encode(AutosWS.toMap(model));
}