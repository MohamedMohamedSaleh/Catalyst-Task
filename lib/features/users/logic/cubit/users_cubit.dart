import 'package:catalyst_task/features/users/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/dio_service.dart';
import '../../../../core/api/end_ponits.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final DioService dioService;
  UsersCubit(this.dioService) : super(UsersInitial());

  Future<void> showUsers() async {
    emit(ShowUsersLoading());
    final response = await dioService.get(EndPoints.users);

    if (response.isSuccess) {
      final List<UserModel> usersList = (response.response!.data as List<dynamic>)
    .map((item) => UserModel.fromMap(item))
    .toList();
      emit(ShowUsersSuccess(list: usersList));
    } else {
      print("there is an error ==>> ${response.message}");
      emit(ShowUsersError());
    }
  }
}
