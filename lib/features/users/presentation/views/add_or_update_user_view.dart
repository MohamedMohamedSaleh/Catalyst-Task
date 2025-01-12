import 'dart:io';
import 'package:catalyst_task/core/constants/my_colors.dart';
import 'package:catalyst_task/core/widgets/app_image.dart';
import 'package:catalyst_task/core/widgets/custom_selected_widget.dart';
import 'package:catalyst_task/features/users/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiwi/kiwi.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';
import '../../../../core/widgets/custom_filled_button_widget.dart';
import '../../../../core/widgets/custom_text_form_widget.dart';
import '../../../../core/widgets/un_focus.dart';
import '../../logic/cubit/users_cubit.dart';
import '../widgets/user_image_widget.dart';

class AddOrUpdateUserView extends StatefulWidget {
  const AddOrUpdateUserView({super.key, this.user, this.isAddUser = false});
  final UserModel? user;
  final bool isAddUser;

  @override
  State<AddOrUpdateUserView> createState() => _AddOrUpdateUserViewState();
}

class _AddOrUpdateUserViewState extends State<AddOrUpdateUserView> {
  late final UsersCubit userCubit;
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final GlobalKey<FormState> formKey;
  late AutovalidateMode autovalidateMode;
  String role = "";
  String? imagePath;

  @override
  void initState() {
    userCubit = KiwiContainer().resolve<UsersCubit>();
    formKey = GlobalKey<FormState>();
    autovalidateMode = AutovalidateMode.disabled;
    if (widget.isAddUser) {
      role = "client";
      nameController = TextEditingController();
      emailController = TextEditingController();
      phoneController = TextEditingController();
    } else {
      nameController = TextEditingController(text: widget.user?.name);
      emailController = TextEditingController(text: widget.user?.email);
      phoneController = TextEditingController(text: widget.user?.phone);
      role = widget.user?.role ?? "client";
    }
    super.initState();
  }

  @override
  dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  void selectImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      imagePath = file.path;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return UnFocus(
      child: Scaffold(
        appBar: CustomAppBarWidget(
          title: widget.isAddUser ? "Add User" : "Update User",
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _openImage(
                        context,
                        image: widget.isAddUser
                            ? imagePath ?? Assets.imagesUser
                            : imagePath ?? widget.user!.profileImage,
                        isFile: imagePath != null,
                      ),
                      child:
                          UserImageWidget(imagePath: imagePath, widget: widget),
                    ),
                    _cameraWidget(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: nameController,
                  labelText: 'Name',
                  icon: const Icon(
                    Icons.person_outline,
                    color: MyColors.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  keyboardType: TextInputType.emailAddress,
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
                  keyboardType: TextInputType.phone,
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
                      title: widget.isAddUser ? 'Add User' : 'Update User',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          userCubit.addOrUpdateUser(
                            id: widget.user?.id,
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            role: role,
                            profileImage: imagePath,
                            isUpdate: !widget.isAddUser,
                          );
                        } else {
                          autovalidateMode = AutovalidateMode.onUserInteraction;
                          setState(() {});
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Positioned _cameraWidget() {
    return Positioned(
      bottom: -6,
      right: -4,
      child: IconButton(
        onPressed: () => selectImage(),
        icon: const CircleAvatar(
          radius: 17.5,
          child: CircleAvatar(
            radius: 15.5,
            backgroundColor: MyColors.primaryColor,
            child: Icon(
              Icons.camera_alt_outlined,
              size: 18,
              color: MyColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _openImage(BuildContext context,
      {required String image, bool isFile = false}) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: const Color.fromARGB(161, 0, 0, 0),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InteractiveViewer(
          child: isFile
              ? Image.file(File(image))
              : AppImage(
                  image, // Replace with your image path
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
