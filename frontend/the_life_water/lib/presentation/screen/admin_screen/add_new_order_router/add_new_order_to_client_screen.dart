import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_life_water/domain/entities/client.dart';
import 'package:the_life_water/infrastructure/datasource/luisDatasource.dart';
import 'package:the_life_water/infrastructure/repositories/client_repositorie_impl.dart';
import 'package:go_router/go_router.dart';

class AddNewBuyToClientScreen extends StatelessWidget {
  const AddNewBuyToClientScreen({super.key});

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
                      'Nuevo Pedido',
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
                    _FormNewOrder(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class _FormNewOrder extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormNewOrderState();
}

class _FormNewOrderState extends ConsumerState<_FormNewOrder> {
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
    // final listaOrdenes = ref.watch(pedidoStateProvider);
    final List<Client> clientes = [
      Client(
          id: 1,
          nombre: 'Gelo',
          apellido: 'Figueora',
          numTelefono: 93848483,
          borrado: false),
      Client(
          id: 2,
          nombre: 'Daniela',
          apellido: 'Figueora',
          numTelefono: 93848483,
          borrado: false),
      Client(
          id: 3,
          nombre: 'Damiás',
          apellido: 'Figueora',
          numTelefono: 93848483,
          borrado: false),
      Client(
          id: 4,
          nombre: 'Hela',
          apellido: 'Figueora',
          numTelefono: 93848483,
          borrado: false),
      Client(
          id: 5,
          nombre: 'Chayane',
          apellido: 'Figueora',
          numTelefono: 93848483,
          borrado: false),
    ];

    final List<int> ruta = [1, 2, 3, 4];

    return FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FormBuilderDropdown<int>(
                name: 'Cliente',
                decoration: InputDecoration(
                  labelText: 'Cliente',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12.0), // Bordes redondeados
                  ),
                  prefixIcon: const Icon(Icons.person), // Ícono al inicio
                  filled: true,
                  fillColor: Colors.grey[100], // Fondo ligero
                ),
                items: clientes
                    .map((cliente) => DropdownMenuItem<int>(
                          value: cliente.id,
                          child: Row(
                            children: [
                              Text('${cliente.nombre}  '),
                              Text(cliente.apellido)
                            ],
                          ),
                        ))
                    .toList()),
            const SizedBox(
              height: 20,
            ),
            FormBuilderDateTimePicker(
              name: 'dia_entrega',
              initialDatePickerMode: DatePickerMode.day,
              inputType: InputType.date,
              decoration: InputDecoration(
                labelText: 'Día de Entrega',
                hintText: 'Selecciona el día de entrega',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                prefixIcon: const Icon(Icons.calendar_today),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            FormBuilderCheckboxGroup<int>(
              name: 'lista_productos',
              options: const <FormBuilderFieldOption<int>>[
                FormBuilderFieldOption(
                  value: 1,
                  child: Text('Producto 1'),
                ),
                FormBuilderFieldOption(
                  value: 2,
                  child: Text('Producto 2'),
                ),
                FormBuilderFieldOption(
                  value: 3,
                  child: Text('Producto 3'),
                ),
                FormBuilderFieldOption(
                  value: 4,
                  child: Text('Producto 4'),
                ),
                FormBuilderFieldOption(
                  value: 5,
                  child: Text('Producto 5'),
                ),
              ],
              decoration: InputDecoration(
                labelText: 'Selecciona los productos',
                hintText: 'Elige los productos que desea comprar',
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                helperText: 'Puedes elegir varios productos de la lista',
                helperStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                contentPadding: const EdgeInsets.all(12.0),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              initialValue: const [1],
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(1,
                    errorText: 'Selecciona al menos un producto'),
              ]),
              activeColor: Colors.blue,
              checkColor: Colors.white,
            ),

            const SizedBox(
              height: 20,
            ),
            FormBuilderDropdown<int>(
                name: 'ruta',
                decoration: InputDecoration(
                  labelText: 'Ruta',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  prefixIcon: const Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                items: ruta
                    .map((numRuta) => DropdownMenuItem<int>(
                        value: numRuta, child: Text(numRuta.toString())))
                    .toList()),
            //boton de termino
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            BotonCustomForm(
              formKey: _formKey,
              luisDatasource: luisDatasource,
            )
          ],
        ));
  }
}

InputDecoration decorationFormOrder(
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

class BotonCustomForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final ClientRepositorieImpl luisDatasource;

  const BotonCustomForm(
      {super.key, required this.formKey, required this.luisDatasource});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 340,
      color: Colors.blue,
      onPressed: () async {
        formKey.currentState!.save();
        if (formKey.currentState!.validate() == true) {
          final formData = formKey.currentState!.value;

          //TODO: crear el guardado de las ordenes
          final Client newClient = Client(
              nombre: formData['nombre'],
              apellido: formData['sector'],
              numTelefono: formData['numero'],
              borrado: false,
              id: 0);

          final result = luisDatasource.createNewClient(newClient);

          print('proceso creacion de cliente terminado, resultado: $result');

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(seconds: 3),
              content: Text('Creado Correctamente')));
          GoRouter.of(context).pop();
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'Crear',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
