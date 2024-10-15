import 'package:the_life_water/domain/databases/datasource_model.dart';
import 'package:the_life_water/domain/repositories/repositorie.dart';

class ClientRepositorieImpl extends Repositorie {
  final DatasourceModel datasource;

  ClientRepositorieImpl({required this.datasource});
  @override
  Future deleteItem() {
    return datasource.deleteItem();
  }

  @override
  Future getItem() {
    return datasource.getItem();
  }

  @override
  Future getUser() {
    return datasource.getUser();
  }

  @override
  Future getUserByID() {
    return datasource.getUserByID();
  }

  @override
  Future postItem() {
    return datasource.postItem();
  }

  @override
  Future postUser() {
    return datasource.postUser();
  }
}
