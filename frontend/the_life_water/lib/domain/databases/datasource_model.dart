import 'package:the_life_water/domain/entities/client.dart';
import 'package:the_life_water/domain/entities/product.dart';

abstract class DatasourceModel {
  //Clientes
  Future<List<Client>> getUser();
  Future<void> postUser();
  Future<Client> getUserByID();
  Future<void> createNewClient(Client newClient);

  //Productos
  Future<List<Product>> getProduct();
  Future<void> createNewProduct(Product newProduct);
}
