import 'package:flutter/material.dart';
import 'package:servicely_app1/core/theme/app_theme.dart';
import 'package:servicely_app1/features/orders/presentation/sections/order_list_section.dart';
import 'package:servicely_app1/gen/assets.gen.dart';

class InfoSection extends StatelessWidget {
  final OrderItem order;
  const InfoSection({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    order.date,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  Text(
                    ":     تاريخ استلام الخدمة",
                    style: TextStyle(color: secondaryColorHex),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Assets.images.date.image(),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    order.time,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  Text(
                    ":     وقت استلام الخدمة",
                    style: TextStyle(color: secondaryColorHex),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Assets.images.date.image(),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                textDirection: TextDirection.rtl,
                "ومن هنا وجب على المصمم أن يضع نصوصا مؤقتة على التصميم ليظهر للعميل الشكل كاملاً،دور مولد النصر عالمصمم عناء البحث عن نص لبحث ع ومن هنا وجب على المصمم أن يضع نصوصا مؤقتة على التصميم ليظهر للعميل الشكل كاملاً،دور مولد النصر عالمصمم عناء البحث عن نص لبحث",
                style: TextStyle(color: secondaryColorHex, fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
