import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final String price;

  const PriceTag({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$price ر.س",
      style: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
