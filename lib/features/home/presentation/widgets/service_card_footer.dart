import 'package:flutter/material.dart';
import 'price_tag.dart';

class ServiceCardFooter extends StatelessWidget {
  const ServiceCardFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text("محمود عبد الله"),
            const PriceTag(price: "170"),
          ],
        ),
        SizedBox(width: 8),
        Container(
          margin: const EdgeInsets.only(right: 8),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: const Icon(Icons.person, color: Colors.white),
        ),
      ],
    );
  }
}
