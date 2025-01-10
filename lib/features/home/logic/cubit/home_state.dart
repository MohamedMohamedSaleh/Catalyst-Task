part of 'home_cubit.dart';

@immutable
sealed class HomeStates {}

final class HomeInitial extends HomeStates {}

final class HomeChangeIndex extends HomeStates {}
