import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:servicely_app1/features/home/presentation/widgets/service_action_row.dart';
import 'service_card_footer.dart';

class ServiceCard extends StatelessWidget {
  final String serviceName;

  const ServiceCard({
    super.key,
    required this.serviceName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
            child: SvgPicture.asset(
              "assets/images/Rectangle 1137.svg",
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(serviceName),
                const Text("نوع الخدمة"),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Icon(Icons.location_on, size: 16),
                SizedBox(width: 5),
                Text("الرياض , الدرعية"),
                Spacer(),
                Icon(Icons.calendar_today, size: 16),
                SizedBox(width: 5),
                Text("7 نوفمبر 2025"),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: ServiceCardFooter(),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ServiceActionsRow(
              onDetails: () {},
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
