import 'package:the_life_water/domain/databases/datasource_model.dart';
import 'package:the_life_water/domain/repositories/repositorie.dart';

class ClientRepositorieImpl extends Repositorie {
  final DatasourceModel datasource;

  ClientRepositorieImpl({required this.datasource});

  @override
  Future getUser() {
    return datasource.getUser();
  }

  @override
  Future getUserByID() {
    return datasource.getUserByID();
  }

  @override
  Future postUser() {
    return datasource.postUser();
  }

  @override
  Future deleteItem() {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  Future getItem() {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future postItem() {
    // TODO: implement postItem
    throw UnimplementedError();
  }
}
