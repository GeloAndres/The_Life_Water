import 'package:flutter/material.dart';
import 'package:the_life_water/presentation/widget/admin_screen_widget/box_bottom.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Life Water'),
        actions: <Widget>[
          const Text('ADMIN'),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.assignment_turned_in_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.route_outlined),
          ),
          const SizedBox(
            width: 20,
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
    return Center(
      child: Column(
        children: [
          _StateConductor(),
          _DistributionBottom(),
          const SizedBox(
            height: 90,
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
      margin: const EdgeInsets.only(top: 30),
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
                Text('Daniela cataldo sanchez')
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
    return Wrap(
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        BoxBottom(
          dataIcon: Icons.person_add,
          label: 'Crear Nuevo Cliente',
          actionFuntion: () {},
        ),
        BoxBottom(
          dataIcon: Icons.description,
          label: 'Generar Informe',
          actionFuntion: () {},
        ),
        BoxBottom(
          dataIcon: Icons.inventory_sharp,
          label: 'Agregar Nuevo Producto',
          actionFuntion: () {},
        ),
        BoxBottom(
          dataIcon: Icons.new_releases_outlined,
          label: 'por determinar',
          actionFuntion: () {},
        ),
      ],
    );
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
