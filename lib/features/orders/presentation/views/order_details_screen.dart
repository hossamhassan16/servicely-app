import 'package:flutter/material.dart';
import 'package:servicely_app1/core/theme/app_theme.dart';
import 'package:servicely_app1/features/orders/presentation/sections/bottom_action_section.dart';
import 'package:servicely_app1/features/orders/presentation/sections/description_section.dart';
import 'package:servicely_app1/features/orders/presentation/sections/images_section.dart';
import 'package:servicely_app1/features/orders/presentation/sections/info_section.dart';
import 'package:servicely_app1/features/orders/presentation/sections/order_list_section.dart';
import 'package:servicely_app1/features/orders/presentation/sections/provider_section.dart';
import 'package:servicely_app1/features/orders/presentation/widgets/order_card_widget.dart';

class OrderDetailsScreen extends StatefulWidget {
  final OrderItem order;
  const OrderDetailsScreen({super.key, required this.order});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  int selectedRating = 4;
  final TextEditingController reviewController = TextEditingController();
  bool hasReviewed = false;
  String reviewText = '';

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  Future<void> _showRatingSheet() async {
    reviewController.text = reviewText;
    int tempRating = selectedRating;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'تقييم الخدمة',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'ما هو تقييمك العام للخدمة؟',
                style: TextStyle(color: secondaryColorHex),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              StatefulBuilder(
                builder: (context, setModalState) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      final value = index + 1;
                      return IconButton(
                        onPressed: () {
                          setModalState(() {
                            tempRating = value;
                          });
                        },
                        icon: Icon(
                          tempRating >= value ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 35,
                        ),
                      );
                    }),
                  );
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: reviewController,
                minLines: 3,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'اكتب تقييمك هنا',
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedRating = tempRating;
                    reviewText = reviewController.text.trim();
                    hasReviewed = reviewText.isNotEmpty;
                  });
                  Navigator.pop(sheetContext);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColorHex,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('تقييم'),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () => Navigator.pop(sheetContext),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('الغاء'),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  Widget _buildReviewCard() {
    if (!hasReviewed) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    selectedRating,
                    (index) =>
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'احمد محمد',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'منذ ساعة',
                      style: TextStyle(color: secondaryColorHex, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              reviewText,
              textAlign: TextAlign.right,
              style: const TextStyle(
                  fontSize: 13, color: Colors.black87, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 48),
            const Center(
              child: Text(
                'تفاصيل الطلب',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      OrderDetailsCard(
                        status: widget.order.status,
                        statusColor: widget.order.statusColor,
                        time: widget.order.time,
                        date: widget.order.date,
                        title: widget.order.title,
                      ),
                      DescriptionSection(order: widget.order),
                      ImagesSection(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('مقدم الخدمة'),
            ),
            const SizedBox(height: 8),
            const ProviderSection(),
            const SizedBox(height: 18),
            _buildReviewCard(),
            if (hasReviewed) const SizedBox(height: 16),
            InfoSection(order: widget.order),
            const SizedBox(height: 16),
            BottomActionSection(
              status: widget.order.status,
              onRate: _showRatingSheet,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
