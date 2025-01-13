class ProductoDbResponse {
  final int id;
  final String nombre;
  final String descripcion;
  final double precio;
  final bool borrado;

  ProductoDbResponse({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.borrado,
  });

  factory ProductoDbResponse.fromJson(Map<String, dynamic> json) =>
      ProductoDbResponse(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        borrado: json["borrado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "borrado": borrado,
      };
}
