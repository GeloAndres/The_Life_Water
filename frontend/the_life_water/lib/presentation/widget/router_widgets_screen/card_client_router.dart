import 'package:flutter/material.dart';

class CardClientRouter extends StatelessWidget {
  const CardClientRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 390,
        margin: const EdgeInsets.only(bottom: 10, top: 5),
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            _CardDataActionRouter(),
            Row(
              children: [
                _CardDetailToBuy(),
                Center(
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.edit,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//carta de acciones (funciones) de ruta
class _CardDataActionRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white70, borderRadius: BorderRadius.circular(20)),
        height: 140,
        width: 360,
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Icon(Icons.person),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Elmer Figueroa',
                  style: TextStyle(fontSize: 26),
                ),
              ],
            ),
            Row(
              children: [
                _BottomToCardRouter(
                  colorIcon: Colors.green,
                  iconData: Icons.call,
                  onPressAction: () {},
                ),
                _BottomToCardRouter(
                    iconData: Icons.pause, onPressAction: () {}),
                _BottomToCardRouter(
                    iconData: Icons.check, onPressAction: () {}),
                _BottomToCardRouter(
                    iconData: Icons.arrow_forward, onPressAction: () {}),
              ],
            ),
          ],
        ));
  }
}

//Entidades boton de cardClient
class _BottomToCardRouter extends StatelessWidget {
  final VoidCallback onPressAction;
  final IconData iconData;
  final Color colorIcon;

  const _BottomToCardRouter(
      {required this.onPressAction,
      required this.iconData,
      this.colorIcon = Colors.black});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: IconButton(
      iconSize: 50,
      onPressed: onPressAction,
      icon: Icon(iconData),
      color: colorIcon,
    ));
  }
}

//datalles de la venta
class _CardDetailToBuy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 200,
        width: 310,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detalles de la compra',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text('Estado del pago: Pagado', style: TextStyle(fontSize: 18)),
              Text('7x recargas de agua \n1x Dispenmsador de agua',
                  style: TextStyle(fontSize: 18)),
            ],
          ),
        ));
  }
}
