import 'package:the_life_water/domain/entities/client.dart';

abstract class DatasourceModel {
  //Clientes
  Future<List<Client>> getUser();
  Future<void> postUser();
  Future<Client> getUserByID();
  Future<void> createNewClient(Client newClient);
}
