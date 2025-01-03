import 'package:the_life_water/domain/entities/client.dart';

abstract class Repositorie {
  //Clientes
  Future<dynamic> getUser();
  Future<dynamic> postUser();
  Future<dynamic> getUserByID();
  Future<void> createNewClient(Client newClient);
}
