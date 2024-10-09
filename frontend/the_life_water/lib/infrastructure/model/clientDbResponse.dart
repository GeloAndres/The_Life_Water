class ClientDbResponse {
  final int id;
  final String nombre;
  final String apellido;
  final int numTelefono;
  final bool borrado;

  ClientDbResponse({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.numTelefono,
    required this.borrado,
  });

  factory ClientDbResponse.fromJson(Map<String, dynamic> json) =>
      ClientDbResponse(
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
