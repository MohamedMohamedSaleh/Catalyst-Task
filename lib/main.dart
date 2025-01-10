import 'package:catalyst_task/core/constants/my_colors.dart';
import 'package:catalyst_task/core/service_locator/kiwi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/functions.dart';
import 'features/home/presentation/views/home_view.dart';

void main() {
  initKiwi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'Catalyst Task',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryColor),
          useMaterial3: true,
        ),
        home: child,
      ),
      child: const Homeview(),
    );
  }
}
