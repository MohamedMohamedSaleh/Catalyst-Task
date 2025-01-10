
import 'package:flutter/material.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../../core/widgets/app_image.dart';
import '../../logic/cubit/home_cubit.dart';

class MyButtomNavigationBar extends StatelessWidget {
  const MyButtomNavigationBar({
    super.key,
    required this.homeCubit,
  });

  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: MyColors.whiteColor,
      unselectedItemColor: const Color.fromARGB(255, 234, 173, 242),
      backgroundColor: Colors.deepPurple,
      selectedLabelStyle: TextStyle(
        fontSize: 14,
        color: homeCubit.currentPage == 0
            ? MyColors.whiteColor
            : const Color.fromARGB(255, 223, 22, 22),
      ),
      unselectedLabelStyle:
          const TextStyle(fontSize: 12, color: Colors.grey),
      type: BottomNavigationBarType.fixed,
      currentIndex: homeCubit.currentPage,
      onTap: (index) {
          homeCubit.setCurrentIndex(newIndex: index);
          homeCubit.pageController.jumpToPage(homeCubit.currentPage);
      },
      selectedFontSize: homeCubit.currentPage == 0 ? 14 : 12,
      items: [
        ...List.generate(
          homeCubit.pagesList.length,
          (index) => BottomNavigationBarItem(
            icon: AppImage(
              homeCubit.pagesList[index].icon,
              height: homeCubit.currentPage == index ? 24 : 21,
              color: homeCubit.currentPage == index
                  ? MyColors.whiteColor
                  : const Color.fromARGB(255, 234, 173, 242),
            ),
            label: homeCubit.pagesList[index].title,
          ),
        ),
      ],
    );
  }
}
