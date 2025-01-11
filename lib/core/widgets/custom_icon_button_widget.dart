import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_image.dart';

class CustomIcontButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final String icon;
  final Color iconColor;

  final bool isLoading;
  const CustomIcontButtonWidget({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.iconColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(7.r)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: (isLoading)
            ? Center(
                child: SizedBox(
                height: 15.5.w,
                width: 15.5.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 1,
                  color: Colors.red,
                ),
              ))
            : AppImage(
                icon,
                width: 15,
                color: iconColor,
              ),
      ),
    );
  }
}
