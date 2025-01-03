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
        id: json["id"] ?? 0,
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
