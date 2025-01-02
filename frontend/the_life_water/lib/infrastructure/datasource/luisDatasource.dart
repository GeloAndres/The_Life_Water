import 'package:dio/dio.dart';
import 'package:the_life_water/domain/databases/datasource_model.dart';
import 'package:the_life_water/domain/entities/client.dart';
import 'package:the_life_water/infrastructure/model/clientDbResponse.dart';

class Luisdatasource extends DatasourceModel {
  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8090'));

  @override
  Future<List<Client>> getUser() async {
    try {
      final response = await dio.get('/usuario');

      if (response.statusCode == 200) {
        final clientDbResponse = ClientDbResponse.fromJson(response.data);

        return clientDbResponse.clients;
      } else {
        throw Exception(
            'Error en la solicitud, status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al obtener los clientes: $e');
    }
  }

  @override
  void createNewClient() {
    // TODO: implement createNewClient
  }

  @override
  Future<Client> getUserByID() {
    // TODO: implement getUserByID
    throw UnimplementedError();
  }

  @override
  Future<void> postUser() {
    // TODO: implement postUser
    throw UnimplementedError();
  }
}
