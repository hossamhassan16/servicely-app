import 'package:flutter/material.dart';
import 'package:servicely_app1/features/home/presentation/widgets/service_action_row.dart';
import 'package:servicely_app1/features/home/presentation/views/service_detail_screen.dart';
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
            child: Image.asset("assets/images/box.png"),
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
              onDetails: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceDetailScreen(
                      serviceName: serviceName,
                      serviceType: "نوع الخدمة",
                      location: "الرياض , الدرعية",
                      date: "7 نوفمبر 2025",
                      description:
                          "يوفر هذا التطبيق خدمات متخصصة في رعاية الحيوانات الأليفة، حيث نقدم خدمات شاملة تشمل العناية البيطرية والتنظيف والتدريب. فريقنا من الخبراء مؤهل بشكل احترافي وملتزم بتقديم أفضل رعاية لحيواناتك الأليفة.",
                      providerName: "محمد عبد الله",
                      providerRating: "170",
                      providerImage: "assets/images/profile.png",
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
