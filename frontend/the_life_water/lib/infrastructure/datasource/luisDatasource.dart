import 'package:dio/dio.dart';

class Luisdatasource {
  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8090'));

  //TODO: mach de json a data

  Future<dynamic> getUser() async {
    final response = await dio.get('/usuario');
    if (response.statusCode == 200) {
      return response; //devuelve Json-map
    } else {
      return Exception('Failed to load data');
    }
  }

  // Future<dynamic> addUser() async {
  //   final response = await dio.post('/usuario');
  //   if (response.statusCode == 200) {
  //     print(response);
  //     return response;
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  // Future<dynamic> deleteUser() async {
  //   final response = await dio.delete('/usuario');
  //   if (response.statusCode == 200) {
  //     print(response);
  //     return response;
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }
}
