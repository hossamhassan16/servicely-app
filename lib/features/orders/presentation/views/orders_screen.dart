import 'package:flutter/material.dart';
import 'package:servicely_app1/features/orders/presentation/sections/order_filter_section.dart';
import 'package:servicely_app1/features/orders/presentation/sections/order_list_section.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  String selectedMainStatus = "طلباتي";
  String selectedSubStatus = "طلبات جارية";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" الطلبات"),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffF6F7FB),
      body: SafeArea(
        child: Column(
          children: [
            OrdersFilterSection(
              selectedMainStatus: selectedMainStatus,
              selectedSubStatus: selectedSubStatus,
              onMainStatusChanged: (value) {
                setState(() {
                  selectedMainStatus = value;
                });
              },
              onSubStatusChanged: (value) {
                setState(() {
                  selectedSubStatus = value;
                });
              },
            ),
            Expanded(
              child: OrdersListSection(
                selectedMainStatus: selectedMainStatus,
                selectedSubStatus: selectedSubStatus,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
