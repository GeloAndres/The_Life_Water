import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pedidos'),
        ),
        body: _BodycustomerOrder(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.go('/addnewbuy');
          },
          child: const Icon(Icons.plus_one),
        ));
  }
}

class _BodycustomerOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Clientes'),
            Text('Fechas'),
            Text('Accion'),
          ],
        ),
        Text('Creacion de listview para ver pedidos en formato lista'),
        CircularProgressIndicator()
      ],
    );
  }
}
