import 'package:flutter/material.dart';
import 'package:the_life_water/domain/entities/client.dart';
import 'package:the_life_water/presentation/screen/admin_screen/watch_client/update_client/update_client.dart'; // Importar el modelo Client

class ClientDetailsScreen extends StatelessWidget {
  final Client client;

  const ClientDetailsScreen({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${client.nombre} ${client.apellido}'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          const SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateClient(
                      cliente: client,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.edit)),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${client.id}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Nombre: ${client.nombre}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Apellido: ${client.apellido}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Teléfono: ${client.numTelefono}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Borrado: ${client.borrado ? "Sí" : "No"}',
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
