import 'package:the_life_water/domain/entities/client.dart';
import 'package:the_life_water/domain/entities/order.dart';
import 'package:the_life_water/domain/entities/product.dart';

abstract class DatasourceModel {
  //Clientes
  Future<List<Client>> getUser();
  Future<void> postUser();
  Future<Client> getUserByID();
  Future<void> createNewClient(Client newClient);
  Future<void> deleteUser(Client client);

  //Productos
  Future<List<Product>> getProduct();
  Future<void> createNewProduct(Product newProduct);

  //Pedidos
  Future<List<Order>> getOrder();
  Future<void> createNewOrder(Order newOrder);
}
