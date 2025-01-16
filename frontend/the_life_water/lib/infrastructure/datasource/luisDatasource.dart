import 'package:dio/dio.dart';
import 'package:the_life_water/domain/databases/datasource_model.dart';
import 'package:the_life_water/domain/entities/client.dart';
import 'package:the_life_water/domain/entities/order.dart';
import 'package:the_life_water/domain/entities/product.dart';
import 'package:the_life_water/infrastructure/mappers/client_mapper.dart';
import 'package:the_life_water/infrastructure/mappers/producto_mapper.dart';
import 'package:the_life_water/infrastructure/model/clientDbResponse.dart';
import 'package:the_life_water/infrastructure/model/producto_db_response.dart';

class Luisdatasource extends DatasourceModel {
  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8090'));

  @override
  Future<List<Client>> getUser() async {
    try {
      final response = await dio.get('/usuario');

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;

        final Iterable<Clientdbresponse> listClientResponse =
            jsonList.map((json) => Clientdbresponse.fromJson(json));

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
  Future<int?> deleteUser(Client client) async {
    final Map<String, dynamic> cliente = {
      'id': client.id,
      'nombre': client.nombre,
      'apellido': client.apellido,
      'numTelefono': client.numTelefono,
      'borrador': client.borrado
    };

    try {
      final response = await dio.post('/usuario/delete', data: {cliente});
      return response.statusCode;
    } catch (e) {
      throw 'Error $e';
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
  Future<void> createNewClient(Client newClient) async {
    try {
      final response = await dio.post(
        '/usuario',
        data: {
          "id": newClient.id,
          "nombre": newClient.nombre,
          "apellido": newClient.apellido,
          "numTelefono": newClient.numTelefono,
          "borrado": newClient.borrado,
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('Usuario creado: ${response.data}');
        return response.data;
      } else {
        print('No salió como esperábamos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al crear el cliente: $e');
    }
  }

  //Sector de Productos
  @override
  Future<void> createNewProduct(Product newProduct) async {
    try {
      final response = await dio.post('/item', data: {
        "id": 0,
        "nombre": newProduct.nombre,
        "descripcion": newProduct.description,
        "precio": newProduct.precio,
        "borrado": false
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Usuario creado: ${response.data}');
        return response.data;
      }
    } catch (e) {
      throw Exception('Error al crear el cliente: $e');
    }
  }

  @override
  Future<List<Product>> getProduct() async {
    try {
      final response = await dio.get('/item');

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;

        final Iterable<ProductoDbResponse> productListResponse =
            jsonList.map((json) => ProductoDbResponse.fromJson(json));

        final List<Product> listProductFinal = productListResponse
            .where((x) => x.id != 0)
            .map((product) => ProductoMapper().toEntiti(product))
            .toList();
        return listProductFinal;
      } else {
        throw Exception(
            'Error en la solicitud, status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al obtener los clientes: $e');
    }
  }

  //Ordenes
  @override
  Future<void> createNewOrder(Order newOrder) async {
    try {
      final response = await dio.get('/itemPedido');

      if (response.statusCode == 200) {}
    } catch (e) {
      throw Exception('Error en la solicitud, status: $e');
    }
  }

  @override
  Future<List<Order>> getOrder() {
    // TODO: implement getOrder
    throw UnimplementedError();
  }
}
