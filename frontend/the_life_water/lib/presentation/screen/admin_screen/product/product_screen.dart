import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
    return const SizedBox(
      width: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Producto'),
            SizedBox(
              width: 70,
            ),
            Text('Valor'),
          ],
        ),
        CircularProgressIndicator()
      ]),
    );
  }
}
