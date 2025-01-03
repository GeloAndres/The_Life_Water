import 'dart:convert';

List<Clientdbresponse> clientesFromJson(String str) =>
    List<Clientdbresponse>.from(
        json.decode(str).map((x) => Clientdbresponse.fromJson(x)));

String clientesToJson(List<Clientdbresponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Clientdbresponse {
  final int id;
  final String nombre;
  final String apellido;
  final int numTelefono;
  final bool borrado;

  Clientdbresponse({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.numTelefono,
    required this.borrado,
  });

  factory Clientdbresponse.fromJson(Map<String, dynamic> json) =>
      Clientdbresponse(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        numTelefono: json["numTelefono"],
        borrado: json["borrado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "numTelefono": numTelefono,
        "borrado": borrado,
      };
}
