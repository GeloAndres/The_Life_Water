import 'package:flutter/material.dart';
import 'package:the_life_water/infrastructure/datasource/luisDatasource.dart';
import 'package:the_life_water/domain/entities/client.dart'; // Asegúrate de importar el modelo Client
import 'package:the_life_water/presentation/screen/admin_screen/watch_client/client_detail_screen.dart';

class WatchClientScreen extends StatefulWidget {
  const WatchClientScreen({super.key});

  @override
  _WatchClientScreenState createState() => _WatchClientScreenState();
}

class _WatchClientScreenState extends State<WatchClientScreen> {
  Future<List<Client>>? _futureClients;

  @override
  void initState() {
    super.initState();
    _fetchClients(); // Llamar a la función para obtener clientes cuando la pantalla se inicializa
  }

  void _fetchClients() {
    setState(() {
      Luisdatasource luisdatasource = Luisdatasource();
      _futureClients = luisdatasource
          .getUser(); // Llamar a la función getUser para obtener los clientes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
      ),
      body: Center(
        child: FutureBuilder<List<Client>>(
          future: _futureClients,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Mostrar un indicador de carga mientras se obtienen los datos
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Mostrar un mensaje si hay un error
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              // Si no hay clientes o no se encontraron
              return const Text('No hay clientes disponibles');
            } else {
              // Mostrar la lista de clientes cuando los datos se obtienen correctamente
              final clients = snapshot.data!;
              return Center(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: clients.length,
                    itemBuilder: (context, index) {
                      final client = clients[index];
                      return ListTile(
                        leading: const Icon(Icons.person),
                        title: Text('${client.nombre} ${client.apellido}'),
                        subtitle: Text('Teléfono: ${client.numTelefono}'),
                        onTap: () {
                          // Navegar a la pantalla de detalles cuando se hace clic
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ClientDetailsScreen(client: client),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
