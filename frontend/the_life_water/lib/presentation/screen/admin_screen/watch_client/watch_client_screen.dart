import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';

class WatchClientScreen extends StatelessWidget {
  const WatchClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('The Life Water'),
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
        const Text('Clientes'),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              context.go('/watchclient/createnewclient');
            },
            child: const Text('Registrar nuevo Cliente')),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre'),
            SizedBox(
              width: 70,
            ),
            Text('Direccion')
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
