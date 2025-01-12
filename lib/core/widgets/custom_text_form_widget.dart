import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/my_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      required this.labelText,
      required this.controller,
      required this.icon,
      this.validator,
      this.keyboardType});
  final String labelText;
  final TextEditingController controller;
  final Widget icon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter your ${widget.labelText}';
        }
        return null;
      },
      controller: widget.controller,
      cursorHeight: 18,
      keyboardType: widget.keyboardType,
      style: TextStyle(
          color: MyColors.primaryColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10).w,
        prefixIcon: widget.icon,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: MyColors.primaryColor, fontSize: 15.sp),
      ),
    );
  }
}
