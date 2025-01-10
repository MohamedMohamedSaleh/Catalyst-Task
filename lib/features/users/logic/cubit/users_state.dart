part of 'users_cubit.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

//? this is to show Users States
final class ShowUsersLoading extends UsersState {}

final class ShowUsersSuccess extends UsersState {
  final List<UserModel> list;

  ShowUsersSuccess({required this.list});
}

final class ShowUsersError extends UsersState {}
