import 'package:the_life_water/domain/entities/client.dart';
import 'package:the_life_water/infrastructure/model/clientDbResponse.dart';

class ClientMapper {
  Client toDomain(Clientdbresponse model) {
    return Client(
      id: model.id,
      nombre: model.nombre,
      apellido: model.apellido,
      numTelefono: model.numTelefono,
      borrado: model.borrado,
    );
  }
}
