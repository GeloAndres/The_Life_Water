import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_life_water/infrastructure/datasource/luisDatasource.dart';
import 'package:the_life_water/infrastructure/repositories/client_repositorie_impl.dart';

final clienteRepositoryProvider = Provider((ref) {
  return ClientRepositorieImpl(datasource: Luisdatasource());
});

final productRepositoryProvider = Provider((ref) {
  return ClientRepositorieImpl(datasource: Luisdatasource());
});
