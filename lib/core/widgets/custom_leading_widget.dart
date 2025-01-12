import 'package:flutter/material.dart';

import '../constants/my_colors.dart';

class CustomLeadingWidget extends StatelessWidget {
  const CustomLeadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back_ios,
        color: MyColors.primaryColor,
        size: 20,
      ),
    );
  }
}
