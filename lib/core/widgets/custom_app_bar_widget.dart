
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/my_colors.dart';
import 'custom_leading_widget.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const CustomLeadingWidget(),
      title: Text(
        title,
        style: TextStyle(
            color: MyColors.primaryColor,
            fontSize: 17.sp,
            fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  @override

  Size get preferredSize => Size.fromHeight(60.h);
}
