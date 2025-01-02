import 'package:the_life_water/domain/entities/client.dart';

abstract class DatasourceModel {
  //Clientes
  Future<List<Client>> getUser();
  Future<void> postUser();
  Future<Client> getUserByID();
  void createNewClient();

  // //Productos
  // Future<List<Product>> getProduct();
  // Future<void> deleteItem();
  // Future<void> postItem();

  // //Pedidos
  // void getOrder();
  // Future<void> deleteOrder();
  // Future<void> postOrder();
}
