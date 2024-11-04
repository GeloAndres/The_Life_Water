import 'package:flutter/material.dart';

class AddNewBuyToClientScreen extends StatelessWidget {
  const AddNewBuyToClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo pedido'),
      ),
      body: _bodyCustomerNewClient(),
    );
  }
}

class _bodyCustomerNewClient extends StatefulWidget {
  @override
  State<_bodyCustomerNewClient> createState() => _bodyCustomerNewClientState();
}

class _bodyCustomerNewClientState extends State<_bodyCustomerNewClient> {
  @override
  Widget build(BuildContext context) {
    return Column();
  }
}


//TODO: crear una agregacion de clientes con un correcto formulario
// 1 eleccion de clientes
// asignacion de productos al pedido y cantidades