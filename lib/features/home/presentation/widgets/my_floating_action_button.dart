import 'package:catalyst_task/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/my_colors.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    super.key, required this.homeCubit,
  });
  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      backgroundColor: MyColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      onPressed: () {
        switch (homeCubit.currentPage) {
          case 0:
          print("Add new user");
            break;
          case 1:
          print("Add new property");
            break;
          case 2:
          print("Add new booking");
            break;
        }
      },
      child: const Icon(Icons.add_rounded, color: MyColors.whiteColor),
    );
  }
}
