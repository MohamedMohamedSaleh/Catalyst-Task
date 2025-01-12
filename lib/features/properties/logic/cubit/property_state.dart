part of 'property_cubit.dart';

@immutable
sealed class PropertyState {}

final class PropertyInitial extends PropertyState {}

final class PropertyLoading extends PropertyState {}

final class PropertyLoaded extends PropertyState {
  final List<PropertyModel> list;
  PropertyLoaded({required this.list});
}

final class PropertyError extends PropertyState {}
