import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Productos'),
          actions: [
            IconButton(
                onPressed: () {
                  context.push('/product/create_new_product');
                },
                icon: const Icon(
                  Icons.add_circle_outline,
                  size: 30,
                )),
          ],
        ),
        body: _BodyCustomerWatchClient());
  }
}

class _BodyCustomerWatchClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const Text('Productos'),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              // context.go('');
            },
            child: const Text('Registrar nuevo Producto')),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Producto'),
            SizedBox(
              width: 70,
            ),
            Text('Valor'),
          ],
        ),
        const CircularProgressIndicator()
      ]),
    );
  }
}

//TODO: regristrador de cliente
class _RegistrarCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text('Registrar Cliente'));
  }
}
