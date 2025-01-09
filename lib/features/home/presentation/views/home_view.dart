import 'package:catalyst_task/core/constants/app_images.dart';
import 'package:catalyst_task/core/constants/my_colors.dart';
import 'package:catalyst_task/core/widgets/app_image.dart';
import 'package:catalyst_task/features/bookings/presentation/views/bookings_view.dart';
import 'package:catalyst_task/features/properties/presentation/views/properties_view.dart';
import 'package:catalyst_task/features/users/presentation/views/users_view.dart';
import 'package:flutter/material.dart';

import '../../models/page_model.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key, this.currentIndex = 0});
  final int currentIndex;

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  late int currentPage;
  late List<PageModel> pagesList;

  @override
  void initState() {
    super.initState();
    currentPage = widget.currentIndex;
    pagesList = [
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
  }
PageController chatProvider = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: chatProvider,
          onPageChanged: (index) {
            // chatProvider.setCurrentIndex(newIndex: index);
            setState(() {
              currentPage = index;
            });
          },
          children: pagesList.map((pageModel) => pageModel.page).toList(),
        ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: MyColors.whiteColor,
        unselectedItemColor: const Color.fromARGB(255, 234, 173, 242),
        backgroundColor: Colors.deepPurple,
        selectedLabelStyle: TextStyle(
            fontSize: 14,
            color: currentPage == 0
                ? MyColors.whiteColor
                : const Color.fromARGB(255, 223, 22, 22)),
        unselectedLabelStyle: const TextStyle(fontSize: 12, color: Colors.grey),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
            chatProvider.jumpToPage(index);
          });
        },
        selectedFontSize: currentPage == 0 ? 14 : 12,
        items: [
          ...List.generate(
            pagesList.length,
            (index) => BottomNavigationBarItem(
              icon: AppImage(
                pagesList[index].icon,
                height: currentPage == index ? 24 : 21,
                color: currentPage == index
                    ? MyColors.whiteColor
                    : const Color.fromARGB(255, 234, 173, 242),
              ),
              label: pagesList[index].title,
            ),
          ),
        ],
      ),
    );
  }
}
