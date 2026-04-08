import 'package:flutter/material.dart';
import 'package:servicely_app1/core/theme/app_theme.dart';
import 'package:servicely_app1/features/orders/presentation/sections/order_list_section.dart';
import 'package:servicely_app1/features/orders/presentation/views/order_details_screen.dart';

class OrderCard extends StatelessWidget {
  final OrderItem order;
  final String title;
  final String date;
  final String time;
  final String status;
  final Color statusColor;
  final VoidCallback? onTap;

  const OrderCard({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.status,
    required this.statusColor,
    this.onTap,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OrderDetailsScreen(
              order: order,
            ),
          ),
        );
        // if (onTap != null) {
        //   onTap!();
        // } else {
        //   // Navigate to order details screen
        //   context.push(RouterNames.OrderDetail, extra: {
        //     'title': title,
        //     'date': date,
        //     'time': time,
        //     'status': status,
        //   });
        // }
      },
      child: OrderDetailsCard(
          status: status,
          statusColor: statusColor,
          time: time,
          date: date,
          title: title),
    );
  }
}

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({
    super.key,
    required this.status,
    required this.statusColor,
    required this.time,
    required this.date,
    required this.title,
  });

  final String status;
  final Color statusColor;
  final String time;
  final String date;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'حالة الطلب',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 12),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "وقت الطلب",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 12,
                              color: secondaryColorHex,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 48,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      color: secondaryColorHex,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "تاريخ الطلب",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            date,
                            style: TextStyle(
                              fontSize: 12,
                              color: secondaryColorHex,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 48,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      color: secondaryColorHex,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "عنوان الخدمة",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            title,
                            style: const TextStyle(
                              color: secondaryColorHex,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 53, 71, 112),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:
                          const Icon(Icons.inventory_2, color: primaryColorHex),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
