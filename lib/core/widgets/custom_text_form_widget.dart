
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/my_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      required this.labelText,
      required this.controller,
      required this.icon,
      this.validator});
  final String labelText;
  final TextEditingController controller;
  final Widget icon;
  final String? Function(String?)? validator;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      cursorHeight: 18,
      style: const TextStyle(color: MyColors.primaryColor),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10).w,
        prefixIcon: widget.icon,
        labelText: widget.labelText,
       
      ),
    );
  }
}
