import 'package:flutter/material.dart';

class BoxBottom extends StatelessWidget {
  const BoxBottom(
      {super.key,
      required this.dataIcon,
      required this.label,
      required this.actionFuntion});

  final IconData dataIcon;
  final String label;
  final VoidCallback actionFuntion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: SizedBox(
              width: 110,
              height: 110,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    dataIcon,
                    size: 45,
                  ))),
        ),
        Text(label)
      ],
    );
  }
}
