
import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/my_colors.dart';
import '../../../../core/widgets/app_image.dart';
import '../views/add_or_update_user_view.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({
    super.key,
    required this.imagePath,
    required this.widget,
  });

  final String? imagePath;
  final AddOrUpdateUserView widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: MyColors.buttonColor,
      ),
      child: imagePath != null
          ? Image.file(
              File(
                imagePath!,
              ),
              height: 120,
              width: 130,
              fit: BoxFit.cover,
            )
          : AppImage(
              widget.isAddUser ? Assets.imagesUser : widget.user!.profileImage,
              height: 120,
              width: 130,
              fit: BoxFit.cover,
            ),
    );
  }
}
