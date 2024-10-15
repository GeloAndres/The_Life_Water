import 'package:dio/dio.dart';
import 'package:the_life_water/domain/databases/datasource_model.dart';
import 'package:the_life_water/domain/entities/client.dart';
import 'package:the_life_water/domain/entities/product.dart';
import 'package:the_life_water/infrastructure/model/clientDbResponse.dart';

class Luisdatasource extends DatasourceModel {
  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8090'));

  // List<Client> _jsonToClient(Map<String, dynamic> json) {
  //   final movieDbResponse = ClientDbResponse.fromJson(json);

  //   final List<Client> movie = movieDbResponse.results
  //       .where((moviedb) => moviedb.posterPath != 'no-poster')
  //       .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
  //       .toList();

  //   return movie;
  // } TODO: terminar este secmento

  @override
  Future<void> deleteItem() {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getItem() {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<List<Client>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<Client> getUserByID() {
    // TODO: implement getUserByID
    throw UnimplementedError();
  }

  @override
  Future<void> postItem() {
    // TODO: implement postItem
    throw UnimplementedError();
  }

  @override
  Future<void> postUser() {
    // TODO: implement postUser
    throw UnimplementedError();
  }
}
