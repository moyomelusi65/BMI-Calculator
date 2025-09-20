import 'package:flutter/material.dart';

class CatagoryIndicator extends StatelessWidget {
  final Color color;
  final String label;

  const CatagoryIndicator({
    super.key,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        Text(label, style: TextStyle(fontSize: 15)),
      ],
    );
  }
}
