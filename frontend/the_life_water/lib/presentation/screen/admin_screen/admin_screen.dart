import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    return const SizedBox(
        width: 360,
        height: 380,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    _BottonPerosnalCustomBody(
                      iconData: Icons.person_add,
                      label: 'Crear nuevo cliente',
                      ruta: '/createnewclient',
                    ),
                    _BottonPerosnalCustomBody(
                      iconData: Icons.description,
                      label: 'Generar Informe',
                      ruta: '/generationinfo',
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    _BottonPerosnalCustomBody(
                      iconData: Icons.inventory_sharp,
                      label: 'Crear nuevo Producto',
                      ruta: '/createnewproduct',
                    ),
                    _BottonPerosnalCustomBody(
                      iconData: Icons.person,
                      label: 'Ver clientes',
                      ruta: '/watchclient',
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

//boton agregar cliente a ruta
class _BottomPlusClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.go('/addnewbuy');
      },
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
  final String ruta;

  const _BottonPerosnalCustomBody(
      {required this.iconData, required this.label, required this.ruta});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ElevatedButton(
            onPressed: () {
              context.go(ruta);
            },
            style: ElevatedButton.styleFrom(
                iconColor: Colors.blueGrey,
                elevation: 3,
                minimumSize: const Size(100, 100)),
            child: Icon(
              iconData,
              size: 50,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(label),
      ],
    );
  }
}
