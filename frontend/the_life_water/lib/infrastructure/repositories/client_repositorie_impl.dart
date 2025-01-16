import 'package:the_life_water/domain/databases/datasource_model.dart';
import 'package:the_life_water/domain/entities/client.dart';
import 'package:the_life_water/domain/entities/order.dart';
import 'package:the_life_water/domain/entities/product.dart';
import 'package:the_life_water/domain/repositories/repositorie.dart';

class ClientRepositorieImpl extends Repositorie {
  final DatasourceModel datasource;

  ClientRepositorieImpl({required this.datasource});

  @override
  Future<void> createNewClient(Client newClient) {
    return datasource.createNewClient(newClient);
  }

  @override
  Future<void> deleteUser(Client client) {
    return datasource.deleteUser(client);
  }

  @override
  Future<List<Client>> getUser() {
    return datasource.getUser();
  }

  @override
  Future getUserByID() {
    // TODO: implement getUserByID
    throw UnimplementedError();
  }

  @override
  Future postUser() {
    // TODO: implement postUser
    throw UnimplementedError();
  }

  //sector de producto
  @override
  Future<void> createNewProduct(Product newProduct) {
    return datasource.createNewProduct(newProduct);
  }

  @override
  Future<List<Product>> getProduct() {
    return datasource.getProduct();
  }

  @override
  Future<void> createNewOrder(Order newOrder) {
    // TODO: implement createNewOrder
    throw UnimplementedError();
  }

  @override
  Future<List<Order>> getOrder() {
    // TODO: implement getOrder
    throw UnimplementedError();
  }
}
