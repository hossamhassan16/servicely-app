import 'package:flutter/material.dart';
import 'package:servicely_app1/features/orders/presentation/sections/order_details_section.dart';
import 'package:servicely_app1/features/orders/presentation/sections/order_list_section.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderItem order;
  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return OrderDetailsSection(order: order);
  }
}
