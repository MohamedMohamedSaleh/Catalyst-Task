part of 'users_cubit.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}



//? this is to show Users States
final class ShowUsersLoading extends UsersState {}

final class ShowUsersSuccess extends UsersState {
  final List<UserModel> list;
  final List<UserModel> ownerList;
  final List<UserModel> adminList;
  final List<UserModel> clientList;

  ShowUsersSuccess({required this.list,
    required this.ownerList,
    required this.adminList,
    required this.clientList
  });
   // The copyWith method
  ShowUsersSuccess copyWith({List<UserModel>? list}) {
    return ShowUsersSuccess(
      ownerList: ownerList,
      adminList: adminList,
      clientList: clientList,
      list: list ?? this.list,  // Use the passed list if it's provided, otherwise keep the current one.
    );
  }
}

final class ShowUsersError extends UsersState {
  final String message;

  ShowUsersError({required this.message});
}




//? this is to Delete Users States
final class DeleteUserLoading extends UsersState {
  final int id;
  DeleteUserLoading({required this.id});
}


final class DeleteUserError extends UsersState {
  final String message;
  DeleteUserError({required this.message});
}


//? this is to Update Users States
final class UpdateUserLoading extends UsersState {

  UpdateUserLoading();
}


final class UpdateUserError extends UsersState {
  final String message;
  UpdateUserError({required this.message});
}