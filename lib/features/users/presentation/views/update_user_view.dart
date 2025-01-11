import 'package:catalyst_task/core/constants/my_colors.dart';
import 'package:catalyst_task/core/widgets/app_image.dart';
import 'package:catalyst_task/core/widgets/custom_selected_widget.dart';
import 'package:catalyst_task/features/users/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/custom_filled_button_widget.dart';
import '../../../../core/widgets/custom_text_form_widget.dart';
import '../../../../core/widgets/un_focus.dart';
import '../../logic/cubit/users_cubit.dart';

class UpdateUserView extends StatefulWidget {
  const UpdateUserView({super.key, required this.user});
  final UserModel user;

  @override
  State<UpdateUserView> createState() => _UpdateUserViewState();
}

class _UpdateUserViewState extends State<UpdateUserView> {
  late final UsersCubit userCubit;
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  String role = "";

  @override
  void initState() {
    userCubit = KiwiContainer().resolve<UsersCubit>();
    nameController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);
    phoneController = TextEditingController(text: widget.user.phone);
    role = widget.user.role;
    super.initState();
  }

  @override
  dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UnFocus(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios,
              color: MyColors.primaryColor,
              size: 20,
            ),
          ),
          title: Text(
            'Update User',
            style: TextStyle(
                color: MyColors.primaryColor,
                fontSize: 17.sp,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            children: [
              CustomTextFormField(
                controller: nameController,
                labelText: 'Name',
                icon: const Icon(
                  Icons.person,
                  color: MyColors.primaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                controller: emailController,
                labelText: 'Email',
                icon: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: AppImage(
                    Assets.imagesEmail,
                    color: MyColors.primaryColor,
                    width: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                controller: phoneController,
                labelText: 'Phone',
                icon: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: AppImage(
                    Assets.imagesPhoneCall,
                    color: MyColors.primaryColor,
                    width: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomSelectedWidget(
                role: role,
                lableText: 'Role',
                onChanged: (value) {
                  role = (value ?? "").toLowerCase();
                },
              ),
              const SizedBox(
                height: 40,
              ),
              BlocBuilder(
                bloc: userCubit,
                builder: (context, state) {
                  return CustomFilledButtonWidget(
                    isLoading: state is UpdateUserLoading,
                    title: 'Update User',
                    onPressed: () {
                      userCubit.updateUser(
                        id: widget.user.id,
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        role: role,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
