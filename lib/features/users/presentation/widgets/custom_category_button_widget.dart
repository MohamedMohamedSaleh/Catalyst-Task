
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/my_colors.dart';

class CustomCategorButtonWidget extends StatelessWidget {
  const CustomCategorButtonWidget({
    super.key,
    required this.title,
    required this.isSelected,
    this.onTap,
  });
  final String title;
  final bool isSelected;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
        duration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
          color: isSelected
              ? MyColors.primaryColor
              : const Color.fromARGB(255, 239, 235, 235),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: isSelected ? MyColors.whiteColor : MyColors.buttonColor,
              fontSize: 16.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500),
        ),
      ),
    );
  }
}
