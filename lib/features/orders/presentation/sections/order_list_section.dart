import 'package:flutter/material.dart';
import 'package:servicely_app1/features/orders/presentation/widgets/order_card_widget.dart';

class OrdersListSection extends StatelessWidget {
  final String selectedMainStatus;
  final String selectedSubStatus;

  const OrdersListSection({
    super.key,
    required this.selectedMainStatus,
    required this.selectedSubStatus,
  });

  List<OrderItem> get orders => const [
        OrderItem(
          title: 'طلب تنظيف',
          date: '24 نوفمبر 2025',
          time: '2:40 PM',
          status: 'قيد التنفيذ',
          statusColor: Color(0xff2D6CDF),
          mainStatus: 'طلباتي',
          subStatus: 'طلبات جارية',
        ),
        OrderItem(
          title: 'طلب صيانة',
          date: '22 نوفمبر 2025',
          time: '11:10 AM',
          status: 'تم تسليم الخدمة',
          statusColor: Colors.green,
          mainStatus: 'طلباتي',
          subStatus: 'طلبات مكتملة',
        ),
        OrderItem(
          title: 'طلب تركيب',
          date: '20 نوفمبر 2025',
          time: '9:20 AM',
          status: 'تم رفض الخدمة',
          statusColor: Colors.red,
          mainStatus: 'طلباتي',
          subStatus: 'طلبات ملغية',
        ),
        OrderItem(
          title: 'طلب خدمة',
          date: '26 نوفمبر 2025',
          time: '10:00 AM',
          status: 'قيد التنفيذ',
          statusColor: Color(0xff2D6CDF),
          mainStatus: 'الطلبات على خدماتي',
          subStatus: 'طلبات جارية',
        ),
        OrderItem(
          title: 'طلب خدمة',
          date: '19 نوفمبر 2025',
          time: '4:30 PM',
          status: 'تم تسليم الخدمة',
          statusColor: Colors.green,
          mainStatus: 'الطلبات على خدماتي',
          subStatus: 'طلبات مكتملة',
        ),
        OrderItem(
          title: 'طلب خدمة',
          date: '18 نوفمبر 2025',
          time: '7:15 PM',
          status: 'تم رفض الخدمة',
          statusColor: Colors.red,
          mainStatus: 'الطلبات على خدماتي',
          subStatus: 'طلبات ملغية',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final filteredOrders = orders
        .where((order) => order.mainStatus == selectedMainStatus)
        .where((order) => order.subStatus == selectedSubStatus)
        .toList();

    if (filteredOrders.isEmpty) {
      return Center(
        child: Text(
          'لا توجد طلبات لعرضها',
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 16,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: filteredOrders.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final order = filteredOrders[index];
        return OrderCard(
          title: order.title,
          date: order.date,
          time: order.time,
          status: order.status,
          statusColor: order.statusColor,
          onTap: () {},
          order: order,
        );
      },
    );
  }
}

class OrderItem {
  final String title;
  final String date;
  final String time;
  final String status;
  final Color statusColor;
  final String mainStatus;
  final String subStatus;

  const OrderItem({
    required this.title,
    required this.date,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.mainStatus,
    required this.subStatus,
  });
}
