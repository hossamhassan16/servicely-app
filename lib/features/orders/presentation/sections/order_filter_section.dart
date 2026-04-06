import 'package:flutter/material.dart';
import 'package:servicely_app1/features/orders/presentation/widgets/status_chip_widget.dart';

class OrdersFilterSection extends StatelessWidget {
  final String selectedMainStatus;
  final String selectedSubStatus;
  final ValueChanged<String> onMainStatusChanged;
  final ValueChanged<String> onSubStatusChanged;

  const OrdersFilterSection({
    super.key,
    required this.selectedMainStatus,
    required this.selectedSubStatus,
    required this.onMainStatusChanged,
    required this.onSubStatusChanged,
  });

  final List<String> statusList1 = const [
    "الطلبات على خدماتي",
    "طلباتي",
  ];
  final List<String> statusList2 = const [
    "طلبات ملغية",
    "طلبات مكتملة",
    "طلبات جارية",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 48,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: statusList1.map((status) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: StatusChip(
                      title: status,
                      isSelected: selectedMainStatus == status,
                      onTap: () {
                        onMainStatusChanged(status);
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 48,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: statusList2.map((status) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: StatusChip(
                      title: status,
                      isSelected: selectedSubStatus == status,
                      onTap: () {
                        onSubStatusChanged(status);
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
