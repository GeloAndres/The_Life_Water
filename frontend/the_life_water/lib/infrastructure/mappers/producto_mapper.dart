import 'package:the_life_water/domain/entities/product.dart';
import 'package:the_life_water/infrastructure/model/producto_db_response.dart';

class ProductoMapper {
  Product toEntiti(ProductoDbResponse producto) {
    return Product(
        id: producto.id,
        nombre: producto.nombre,
        description: producto.descripcion,
        precio: producto.precio,
        borrado: producto.borrado);
  }
}
