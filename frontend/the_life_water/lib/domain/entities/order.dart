import 'package:the_life_water/domain/entities/product.dart';

class Order {
  final int idCompra;
  final int idClient;
  final String nombreCliente;
  final DateTime diaVenta;
  final DateTime diaEntrega;
  final List<Product> listaCompra;
  final int asignacionRuta;

  Order(
      {required this.idCompra,
      required this.idClient,
      required this.nombreCliente,
      required this.diaVenta,
      required this.diaEntrega,
      required this.listaCompra,
      required this.asignacionRuta});
}
