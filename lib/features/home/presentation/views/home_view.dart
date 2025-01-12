import 'package:catalyst_task/core/constants/app_images.dart';
import 'package:catalyst_task/core/widgets/app_image.dart';
import 'package:catalyst_task/features/properties/logic/cubit/property_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import '../../../users/logic/cubit/users_cubit.dart';
import '../../logic/cubit/home_cubit.dart';
import '../widgets/my_buttom_navigation_bar.dart';
import '../widgets/my_floating_action_button.dart';

class Homeview extends StatefulWidget {
  const Homeview({
    super.key,
  });

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  late final UsersCubit userscubit;
  late final PropertyCubit propertyCubit;
  late final HomeCubit homeCubit;

  @override
  void initState() {
    userscubit = KiwiContainer().resolve<UsersCubit>()..showUsers();
    propertyCubit = KiwiContainer().resolve<PropertyCubit>()..showProperties();
    homeCubit = KiwiContainer().resolve<HomeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: homeCubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: AppImage(Assets.imagesLogo, height: 25.sp),
            centerTitle: true,
            elevation: 0.5,
          ),
          body: PageView(
            controller: homeCubit.pageController,
            onPageChanged: (index) {
              homeCubit.setCurrentIndex(newIndex: index);
            },
            children:
                homeCubit.pagesList.map((pageModel) => pageModel.page).toList(),
          ),
          bottomNavigationBar: MyButtomNavigationBar(homeCubit: homeCubit),
          floatingActionButton: MyFloatingActionButton(
            homeCubit: homeCubit,
          ),
        );
      },
    );
  }
}
