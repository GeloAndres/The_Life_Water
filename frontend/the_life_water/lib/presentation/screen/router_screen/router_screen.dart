import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterScreen extends StatelessWidget {
  const RouterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('The Life Water'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                context.go('/');
              },
              icon: const Icon(Icons.assignment_turned_in_outlined, size: 30),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.route_outlined, size: 30),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: _BodyRouterCustomer());
  }
}

// el body  de mi Screen router
class _BodyRouterCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {},
          child: const Icon(Icons.assignment_turned_in_outlined)),
    );
  }
}
