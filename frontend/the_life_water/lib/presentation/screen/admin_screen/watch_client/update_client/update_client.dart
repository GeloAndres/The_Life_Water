import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_life_water/domain/entities/client.dart';
import 'package:the_life_water/infrastructure/datasource/luisDatasource.dart';
import 'package:the_life_water/infrastructure/repositories/client_repositorie_impl.dart';
import 'package:go_router/go_router.dart';

class UpdateClient extends StatelessWidget {
  final Client cliente;
  const UpdateClient({super.key, required this.cliente});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: 360,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Actualizar ${cliente.nombre}',
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        letterSpacing: 1.5,
                        shadows: [
                          const Shadow(
                            color: Colors.black26,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    _FormNewClient(
                      cliente: cliente,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class _FormNewClient extends StatefulWidget {
  final Client cliente;

  const _FormNewClient({super.key, required this.cliente});
  @override
  State<_FormNewClient> createState() => _FormNewClientState();
}

class _FormNewClientState extends State<_FormNewClient> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  ClientRepositorieImpl luisDatasource =
      ClientRepositorieImpl(datasource: Luisdatasource());

  @override
  void initState() {
    super.initState();
    _saveNewClient();
  }

  void _saveNewClient() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              name: 'nombre',
              initialValue: widget.cliente.nombre,
              decoration: decorationForm(
                  'Nombre de cliente', Icons.person, 'Nombre Apellido'),
              onChanged: (value) {},
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: 'Nombre es requerido'),
                FormBuilderValidators.minLength(3,
                    errorText: 'Debe tener mas de tres caracteres')
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            FormBuilderTextField(
              name: 'numero',
              initialValue: widget.cliente.numTelefono.toString(),
              decoration:
                  decorationForm('Numero Celular', Icons.phone, '912345678'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: 'Número es requerido'),
                FormBuilderValidators.numeric(
                    errorText: 'Debe ser un número válido'),
                FormBuilderValidators.minLength(9,
                    errorText: 'Debe tener al menos 9 dígitos'),
              ]),
              valueTransformer: (value) {
                if (value == null || value.isEmpty) return null;
                return int.tryParse(value);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            FormBuilderTextField(
              name: 'sector',
              initialValue: widget.cliente.apellido,
              decoration: decorationForm(
                  'Sector / apellido', Icons.maps_home_work, 'Maipu'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: 'Nombre es requerido'),
                FormBuilderValidators.minLength(3,
                    errorText: 'Debe tener mas de tres caracteres')
              ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
            ),
            MaterialButton(
              minWidth: 340,
              color: Colors.blue,
              onPressed: () async {
                _formKey.currentState!.save();
                if (_formKey.currentState!.validate() == true) {
                  final formData = _formKey.currentState!.value;
                  if (widget.cliente.nombre != formData['nombre'] ||
                      widget.cliente.apellido != formData['sector'] ||
                      widget.cliente.numTelefono != formData['numero']) {
                    final Client clientUpDate = Client(
                        nombre: formData['nombre'],
                        apellido: formData['sector'],
                        numTelefono: formData['numero'],
                        borrado: widget.cliente.borrado,
                        id: widget.cliente.id);

                    final result = luisDatasource.createNewClient(clientUpDate);

                    print('Actualizacion: $result');

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text('Actulizado Correctamente')));
                    GoRouter.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text('No hay cambios')));
                  }
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Actualizar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }
}

InputDecoration decorationForm(
    String label, IconData iconData, String hintText) {
  return InputDecoration(
    labelText: label,
    hintText: hintText,
    prefixIcon: Icon(iconData, color: Colors.blueAccent),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Colors.lightBlue, width: 2.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Colors.blueGrey, width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
    ),
    filled: true,
    fillColor: Colors.blue.shade50,
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
  );
}
