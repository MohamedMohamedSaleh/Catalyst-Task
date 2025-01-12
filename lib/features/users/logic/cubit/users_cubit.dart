import 'package:catalyst_task/core/helpers/functions.dart';
import 'package:catalyst_task/features/users/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/api/dio_service.dart';
import '../../../../core/api/end_ponits.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final DioService dioService;
  UsersCubit(this.dioService) : super(UsersInitial());

  Future<void> showUsers(
      {bool isRefresh = true,
      bool isFilter = false,
      String filter = "owner"}) async {
    if (isRefresh) emit(ShowUsersLoading());

    final response = await dioService.get(EndPoints.users);

    if (response.isSuccess) {
      final List<UserModel> usersList =
          (response.response!.data as List<dynamic>)
              .map((item) => UserModel.fromMap(item))
              .toList();
      final ownerList =
          usersList.where((user) => user.role == "owner").toList();
      final clientList =
          usersList.where((user) => user.role == "client").toList();
      final adminList =
          usersList.where((user) => user.role == "admin").toList();
      emit(ShowUsersSuccess(
          list: usersList,
          ownerList: ownerList,
          adminList: adminList,
          clientList: clientList));
    } else {
      emit(ShowUsersError(message: "Erroe occured while getting users"));
    }
  }

  Future<void> deleteUsers(int id) async {
    emit(DeleteUserLoading(id: id));
    final response = await dioService.delete(
      EndPoints.getUserDataEndPoint(id),
    );

    if (response.isSuccess) {
      final message = response.response!.data['message'];
      // emit(DeleteUserSuccess(message: message));
      await showUsers(isRefresh: false);
      showMessage(message: message, type: MessageType.success);
    } else {
      showMessage(message: response.message, type: MessageType.faild);
      emit(DeleteUserError(message: "Erroe occured while getting users"));
    }
  }

  Future<void> addOrUpdateUser({
     int? id,
    required String name,
    required String email,
    required String phone,
    required String role,
    String? profileImage,
    bool isUpdate = false,
  }) async {
    emit(UpdateUserLoading());
    MultipartFile? image;
    if (profileImage != null) {
      image = await uploadImageToAPI(XFile(profileImage));
    }
    final response = await dioService.post(
      isUpdate ? EndPoints.getUserDataEndPoint(id!) : EndPoints.users,
      data: {
        "name": name,
        "email": email,
        "phone": phone,
        "role": role,
        "profile_image": image,
      },
      isFromData: true,
    );

    if (response.isSuccess) {
      final message = response.response!.data['message'];

      await showUsers(isRefresh: false);
      showMessage(message: message, type: MessageType.success);
      Navigator.of(navigatorKey.currentContext!).pop();
    } else {
      showMessage(message: response.message, type: MessageType.faild);
      emit(UpdateUserError(
          message: isUpdate
              ? "Erroe occured while Updating user"
              : "Erroe occured while Adding user"));
    }
  }
  // Future<void> updateUser({
  //   required int id,
  //   required String name,
  //   required String email,
  //   required String phone,
  //   required String role,
  //    String? profileImage,
  // }) async {
  //   print(profileImage);
  //   emit(UpdateUserLoading());
  //   MultipartFile? image;
  //  if (profileImage != null)  image = await uploadImageToAPI(XFile(profileImage));
  //   final response = await dioService.post(
  //     EndPoints.getUserDataEndPoint(id),
  //     data: {
  //       "name": name,
  //       "email": email,
  //       "phone": phone,
  //       "role": role,
  //       "profile_image": image,
  //     },
  //     isFromData: true,
  //   );

  //   if (response.isSuccess) {
  //     final message = response.response!.data['message'];

  //     await showUsers(isRefresh: false);
  //     showMessage(message: message, type: MessageType.success);
  //     Navigator.of(navigatorKey.currentContext!).pop();
  //   } else {
  //     showMessage(message: response.message, type: MessageType.faild);
  //     emit(UpdateUserError(message: "Erroe occured while Updating user"));
  //   }
  // }
}
