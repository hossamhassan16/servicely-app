import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final VoidCallback onTap;

  const FilterButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: const Color(0xffEAF6F3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(
          Icons.filter_list,
          color: Color(0xff1EA68C),
        ),
      ),
    );
  }
}
