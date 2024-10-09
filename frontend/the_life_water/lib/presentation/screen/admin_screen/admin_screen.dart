import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_life_water/presentation/widget/admin_screen_widget/box_bottom.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Life Water'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.assignment_turned_in_outlined,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () {
              context.go('/router');
            },
            icon: const Icon(Icons.route_outlined, size: 30),
          ),
          const SizedBox(
            width: 17,
          )
        ],
      ),
      body: _CustomerBody(),
    );
  }
}

//body customer desing
class _CustomerBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          _StateConductor(),
          _DistributionBottom(),
          const SizedBox(
            height: 40,
          ),
          _BottomPlusClient()
        ],
      ),
    );
  }
}

//Estado del despachador
class _StateConductor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.only(top: 30, bottom: 20),
      padding: const EdgeInsets.all(17),
      height: 105,
      width: 330,
      child: Column(
        children: [
          const Text(
            'En camino hacia...',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.greenAccent.shade700,
                borderRadius: BorderRadius.circular(25)),
            width: 250,
            height: 40,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.navigation_outlined),
                SizedBox(
                  width: 5,
                ),
                Text('Nombre del Cliente')
              ],
            ),
          )
        ],
      ),
    );
  }
}

//Espacio de botones body (extraccion)
class _DistributionBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 350,
        height: 380,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  _BottonPerosnalCustomBody(
                      iconData: Icons.person_add,
                      label: 'Crear nuevo cliente',
                      voidCallback: () {}),
                  _BottonPerosnalCustomBody(
                      iconData: Icons.description,
                      label: 'Generar Informe',
                      voidCallback: () {})
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  _BottonPerosnalCustomBody(
                      iconData: Icons.inventory_sharp,
                      label: 'Crear nuevo Producto',
                      voidCallback: () {}),
                  _BottonPerosnalCustomBody(
                      iconData: Icons.person,
                      label: 'Ver clientes',
                      voidCallback: () {})
                ],
              ),
            )
          ],
        ));
  }
}

//boton agregar cliente a ruta
class _BottomPlusClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          iconColor: Colors.teal,
          elevation: 10,
          minimumSize: const Size(100, 100)),
      child: const Icon(
        Icons.add_road_outlined,
        size: 50,
      ),
    );
  }
}

//Boton personalizado de mis body
class _BottonPerosnalCustomBody extends StatelessWidget {
  final IconData iconData;
  final String label;
  final VoidCallback voidCallback;

  const _BottonPerosnalCustomBody(
      {required this.iconData,
      required this.label,
      required this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return BoxBottom(
      dataIcon: iconData,
      label: label,
      actionFuntion: voidCallback,
    );
  }
}
