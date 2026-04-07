import 'package:flutter/material.dart';
import 'package:servicely_app1/features/orders/presentation/widgets/action_button.dart';

class BottomActionSection extends StatelessWidget {
  final String status;
  final VoidCallback? onRate;

  const BottomActionSection({
    super.key,
    required this.status,
    this.onRate,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        // مررنا الـ context هنا للدالة
        child: _buildButtons(context),
      ),
    );
  }

  // أضفنا (BuildContext context) هنا
  Widget _buildButtons(BuildContext context) {
    if (status == "قيد التنفيذ") {
      return ActionButton(
        title: "إلغاء الطلب",
        color: Colors.red,
        backgroundColor: Colors.white,
      );
    } else if (status == "تم تسليم الخدمة") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text("هل تم استلام الخدمة ؟"),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: ActionButton(
                  title: 'لا',
                  color: Colors.white,
                  backgroundColor: Colors.red,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ActionButton(
                  title: 'نعم',
                  color: Colors.white,
                  backgroundColor: Colors.green,
                  onTap: onRate,
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
