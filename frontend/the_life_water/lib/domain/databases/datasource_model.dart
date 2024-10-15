import 'package:the_life_water/domain/entities/client.dart';
import 'package:the_life_water/domain/entities/product.dart';

abstract class DatasourceModel {
  //Clientes
  Future<List<Client>> getUser();
  Future<void> postUser();
  Future<Client> getUserByID();

  //Productos
  Future<List<Product>> getItem();
  Future<void> deleteItem();
  Future<void> postItem();
}
