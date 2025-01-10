import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

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
  // final cubit = KiwiContainer().resolve<UsersCubit>()..showUsers();
  final homeCubit = KiwiContainer().resolve<HomeCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: homeCubit,
      builder: (context, state) {
        return Scaffold(
          body: PageView(
            controller: homeCubit.pageController,
            onPageChanged: (index) {
              homeCubit.setCurrentIndex(newIndex: index);
            },
            children:
                homeCubit.pagesList.map((pageModel) => pageModel.page).toList(),
          ),
          bottomNavigationBar: MyButtomNavigationBar(homeCubit: homeCubit),
          floatingActionButton: MyFloatingActionButton(homeCubit: homeCubit ,),
        );
      },
    );
  }
}
