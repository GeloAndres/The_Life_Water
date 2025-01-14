import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:the_life_water/domain/entities/client.dart';
import 'package:the_life_water/presentation/Provider/cliente_provider.dart';
import 'package:the_life_water/presentation/screen/admin_screen/watch_client/client_detail_screen.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => OrderScreenState();
}

class OrderScreenState extends ConsumerState<OrdersScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final clientList = ref.watch(clienteRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(
                Icons.refresh,
                size: 30,
              )),
          IconButton(
              onPressed: () {
                context.push('/watchclient/createnewclient');
              },
              icon: const Icon(
                Icons.add_circle_outline,
                size: 30,
              )),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Client>>(
          future: clientList.getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No hay clientes disponibles');
            } else {
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
