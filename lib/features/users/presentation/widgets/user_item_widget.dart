
import 'package:catalyst_task/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/my_colors.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/custom_icon_button_widget.dart';
import '../../logic/cubit/users_cubit.dart';
import '../../models/user_model.dart';
import '../views/update_user_view.dart';

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({super.key, required this.model});
  final UserModel model;

  @override
  Widget build(BuildContext context) {
    final usersCubit = KiwiContainer().resolve<UsersCubit>();
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      clipBehavior: Clip.antiAlias,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: AppImage(
            // "https://bio3.catalyst.com.eg/public/Catalyst_portfolio/IMG_0997%20(1).jpg",
            model.profileImage,
            // height: 120,
            width: 86,
            placeholderHight: 120,
            // height: 125,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 20,
                      child: Text(
                        model.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: MyColors.primaryColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => usersCubit.deleteUsers(model.id),
                      child: BlocBuilder(
                        bloc: usersCubit,
                        builder: (context, state) {
                          return CustomIcontButtonWidget(
                            isLoading: state is DeleteUserLoading &&
                                state.id == model.id,
                            backgroundColor:
                                const Color.fromARGB(255, 232, 178, 178)
                                    .withOpacity(.7),
                            icon: Assets.imagesSvgTrash,
                            iconColor: Colors.red,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () => context.push(UpdateUserView(
                        user: model,
                      )),
                      child: const CustomIcontButtonWidget(
                        backgroundColor: MyColors.buttonColor,
                        icon: Assets.imagesSvgEdit,
                        iconColor: MyColors.whiteColor,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                _rowWidget(icon: Assets.imagesEmail, text: model.email),
                const SizedBox(
                  height: 5,
                ),
                _rowWidget(icon: Assets.imagesPhoneCall, text: model.phone),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _rowWidget(
                            isFlexible: false,
                            icon: Assets.imagesAdd,
                            text: "Created ${model.createdAt}"),
                        const SizedBox(
                          height: 5,
                        ),
                        _rowWidget(
                            isFlexible: false,
                            icon: Assets.imagesEdit,
                            text: "Updated ${model.updatedAt}"),
                      ],
                    ),
                    const Spacer(),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.circular(7.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.0.w, vertical: 4.0.h),
                        child: Text(
                          model.role,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color: MyColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Row _rowWidget({
    required String icon,
    required String text,
    bool isFlexible = true,
  }) {
    return Row(
      children: [
        const SizedBox(
          width: 0,
        ),
        AppImage(
          icon,
          color: MyColors.primaryColor,
          height: 14,
        ),
        const SizedBox(
          width: 4,
        ),
        Flexible(
          flex: isFlexible ? 1 : 0,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: MyColors.primaryColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
