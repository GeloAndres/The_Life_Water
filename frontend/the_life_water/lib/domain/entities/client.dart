class Client {
  final int id;
  final String nombre;
  final String apellido;
  final int numTelefono;
  final bool borrado;

  Client({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.numTelefono,
    required this.borrado,
  });

  // Método para crear un objeto Client a partir de un JSON
  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      numTelefono: json['numTelefono'],
      borrado: json['borrado'],
    );
  }

  // Método para convertir un objeto Client a JSON
  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "numTelefono": numTelefono,
        "borrado": borrado,
      };
}
