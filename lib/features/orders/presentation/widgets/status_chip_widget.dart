import 'package:flutter/material.dart';
import 'package:servicely_app1/core/theme/app_theme.dart';

class StatusChip extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const StatusChip({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color:
              isSelected ? primaryColorHex : Color.fromARGB(255, 222, 221, 221),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? primaryColorHex : Colors.white,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/broken.png",
              width: 20,
              height: 20,
              color: isSelected ? Colors.white : Colors.grey,
            ),
            const SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
