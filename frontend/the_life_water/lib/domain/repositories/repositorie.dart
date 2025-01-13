import 'package:the_life_water/domain/entities/client.dart';
import '../entities/product.dart';

abstract class Repositorie {
  //Clientes
  Future<dynamic> getUser();
  Future<dynamic> postUser();
  Future<dynamic> getUserByID();
  Future<void> createNewClient(Client newClient);

  //Productos
  Future<List<Product>> getProduct();
  Future<void> createNewProduct(Product newProduct);
}
