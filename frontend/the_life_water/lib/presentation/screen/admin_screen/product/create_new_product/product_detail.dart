import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:the_life_water/domain/entities/product.dart';
import 'package:the_life_water/presentation/Provider/cliente_provider.dart';

class ProductClientDetail extends ConsumerWidget {
  final Product product;

  const ProductClientDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context, ref) {
    final clienteProvider = ref.watch(clienteRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('product.nombre'),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('¿Estas seguro?'),
                        content: Text(
                            'Borraremos al usuario ${product.nombre} definitivamente'),
                        actions: [
                          TextButton(
                              onPressed: () {}, child: const Text('Confirmar')),
                          TextButton(
                              onPressed: () {
                                context.pop();
                              },
                              child: const Text('Cancelar'))
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.delete)),
          const SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => UpdateClient(
                //       cliente: product,
                //     ),
                //   ),
                // );
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
            Text('ID: ${product.id}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Nombre: ${product.nombre}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Teléfono: ${product.precio}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Borrado: ${product.description}',
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
