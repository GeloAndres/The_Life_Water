import 'package:flutter/material.dart';

class CreateNewProductScreen extends StatelessWidget {
  const CreateNewProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Creacion Nuevo Producto'),
        ),
        body: _BodyCustomerCreateClient());
  }
}

class _BodyCustomerCreateClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          _FormNewClient()
        ],
      ),
    );
  }
}

class _FormNewClient extends StatefulWidget {
  @override
  State<_FormNewClient> createState() => _FormNewClientState();
}

class _FormNewClientState extends State<_FormNewClient> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        width: 350,
        height: 550,
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _TextFormToNewClient(
                  tipoDato: 'Nombre Producto',
                ),
                const _TextFormToNewClient(
                  tipoDato: 'Valor Producto',
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: const Text('Guardar'),
                ),
              ],
            )));
  }
}

class _TextFormToNewClient extends StatelessWidget {
  const _TextFormToNewClient({required this.tipoDato});

  final String tipoDato;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: tipoDato,
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Campo obligatorio';
        }
        return null;
      },
    );
  }
}
