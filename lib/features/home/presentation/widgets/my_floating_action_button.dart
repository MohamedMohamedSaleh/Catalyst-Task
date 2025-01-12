import 'package:catalyst_task/core/helpers/extensions.dart';
import 'package:catalyst_task/features/home/logic/cubit/home_cubit.dart';
import 'package:catalyst_task/features/properties/presentation/views/add_property_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../users/presentation/views/add_or_update_user_view.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    super.key,
    required this.homeCubit,
  });
  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      backgroundColor: MyColors.buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      onPressed: () {
        switch (homeCubit.currentPage) {
          case 0:
            context.push(const AddOrUpdateUserView(
              isAddUser: true,
            ));
            break;
          case 1:
            context.push(const AddPropertyView());
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
