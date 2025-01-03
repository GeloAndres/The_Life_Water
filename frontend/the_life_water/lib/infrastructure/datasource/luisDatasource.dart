import 'package:dio/dio.dart';
import 'package:the_life_water/domain/databases/datasource_model.dart';
import 'package:the_life_water/domain/entities/client.dart';
import 'package:the_life_water/infrastructure/mappers/client_mapper.dart';
import 'package:the_life_water/infrastructure/model/clientDbResponse.dart';

class Luisdatasource extends DatasourceModel {
  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8090'));

  @override
  Future<List<Client>> getUser() async {
    try {
      final response = await dio.get('/usuario');

      if (response.statusCode == 200) {
        final List<dynamic> jsonList =
            response.data; //transformamos a Lista de Map

        //lo pasamos por el modelo para trabajar la informacion de la peticion
        final Iterable<Clientdbresponse> listClientResponse =
            jsonList.map((json) => Clientdbresponse.fromJson(json));

        //transfomamos el iterable del modelo y lo mappeamos para hacer mach con la entidad Client
        final List<Client> listClientFinal = listClientResponse
            .where((x) => x.id != 0)
            .map((client) => ClientMapper().toEntiti(client))
            .toList();
        return listClientFinal;
      } else {
        throw Exception(
            'Error en la solicitud, status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al obtener los clientes: $e');
    }
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

  @override
  Future<void> createNewClient(Client newClient) {
    // TODO: implement createNewClient
    throw UnimplementedError();
  }
}
