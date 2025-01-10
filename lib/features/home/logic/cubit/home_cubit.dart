import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_images.dart';
import '../../../bookings/presentation/views/bookings_view.dart';
import '../../../properties/presentation/views/properties_view.dart';
import '../../../users/presentation/views/users_view.dart';
import '../../models/page_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);

  List<PageModel> pagesList = [
    PageModel(
      title: "Users",
      icon: Assets.imagesUsers,
      page: const UsersView(),
    ),
    PageModel(
      title: "Properties",
      icon: Assets.imagesProperties,
      page: const PropertiesView(),
    ),
    PageModel(
      title: "Bookings",
      icon: Assets.imagesBookings,
      page: const BookingsView(),
    ),
  ];

  void setCurrentIndex({required int newIndex}) {
    currentPage = newIndex;
    emit(HomeChangeIndex());
  }
}
