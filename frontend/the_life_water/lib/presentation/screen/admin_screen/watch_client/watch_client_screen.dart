import 'package:flutter/material.dart';

class WatchClientScreen extends StatelessWidget {
  const WatchClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Agregar a ruta'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {},
            child: const Icon(Icons.accessible_forward_sharp)),
      ),
    );
  }
}
