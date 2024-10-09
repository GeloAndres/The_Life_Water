import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Testingscreen extends StatelessWidget {
  const Testingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla de prueba'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.go('/');
            },
            child: const Icon(Icons.plumbing)),
      ),
    );
  }
}
