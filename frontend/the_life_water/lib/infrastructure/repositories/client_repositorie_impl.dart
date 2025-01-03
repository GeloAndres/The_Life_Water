import 'package:the_life_water/domain/databases/datasource_model.dart';
import 'package:the_life_water/domain/entities/client.dart';
import 'package:the_life_water/domain/repositories/repositorie.dart';

class ClientRepositorieImpl extends Repositorie {
  final DatasourceModel datasource;

  ClientRepositorieImpl({required this.datasource});

  @override
  Future<void> createNewClient(Client newClient) {
    return datasource.createNewClient(newClient);
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
}
