import 'package:flutter/material.dart';
import 'package:servicely_app1/features/orders/presentation/sections/order_list_section.dart';

class DescriptionSection extends StatelessWidget {
  final OrderItem order;
  const DescriptionSection({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "وصف الخدمة",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          textDirection: TextDirection.rtl,
          "ومن هنا وجب على المصمم أن يضع نصوصا مؤقتة على التصميم ليظهر للعميل الشكل كاملاً،دور مولد النصر عالمصمم عناء البحث عن نص لبحث ع ومن هنا وجب على المصمم أن يضع نصوصا مؤقتة على التصميم ليظهر للعميل الشكل كاملاً،دور مولد النصر عالمصمم عناء البحث عن نص لبحث",
          style: TextStyle(color: Colors.grey, fontSize: 12, height: 1.5),
        )
      ],
    );
  }
}
