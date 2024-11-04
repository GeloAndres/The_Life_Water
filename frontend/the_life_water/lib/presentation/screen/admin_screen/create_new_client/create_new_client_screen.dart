import 'package:flutter/material.dart';

class CreateNewClientScreen extends StatelessWidget {
  const CreateNewClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pantalla Agregar a ruta'),
        ),
        body: _bodyCustomerCreateClient());
  }
}

class _bodyCustomerCreateClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Registrar Nuevo cliente'),
          SizedBox(
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
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        width: 350,
        height: 550,
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _textFormToNewClient(
                  tipoDato: 'Nombre',
                ),
                const _textFormToNewClient(
                  tipoDato: 'Apellido',
                ),
                const _textFormToNewClient(
                  tipoDato: 'Numero de contacto',
                ),
                const _textFormToNewClient(
                  tipoDato: 'Ubicacion',
                ),
                SizedBox(
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

class _textFormToNewClient extends StatelessWidget {
  const _textFormToNewClient({required this.tipoDato});

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
