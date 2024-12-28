import 'package:the_life_water/domain/entities/client.dart';

class ClientDbResponse {
  final List<Client> clients;

  ClientDbResponse({required this.clients});

  // Este factory method convierte un JSON en una lista de objetos Client
  factory ClientDbResponse.fromJson(List<dynamic> jsonList) {
    return ClientDbResponse(
      clients: jsonList.map((json) => Client.fromJson(json)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "clients": clients.map((client) => client.toJson()).toList(),
      };
}
