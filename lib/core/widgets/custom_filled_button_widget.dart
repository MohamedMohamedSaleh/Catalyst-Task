import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/my_colors.dart';

class CustomFilledButtonWidget extends StatelessWidget {
  const CustomFilledButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
  });
  final String title;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
          onPressed: onPressed,
          child: isLoading
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.0.w),
                  child: const LinearProgressIndicator(
                    color: MyColors.whiteColor,
                    backgroundColor: MyColors.buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                )
              : Text(
                  title,
                  style: TextStyle(color: MyColors.whiteColor, fontSize: 16.sp),
                )),
    );
  }
}
