import 'package:catalyst_task/core/constants/my_colors.dart';
import 'package:catalyst_task/core/service_locator/kiwi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/functions.dart';
import 'features/home/presentation/views/home_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: MyColors.primaryColor, // Change status bar color
      statusBarIconBrightness: Brightness.light, // Change icon color to light
    ),
  );
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
          inputDecorationTheme: InputDecorationTheme(
             focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: MyColors.primaryColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 202, 179, 244),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 202, 179, 244),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
          ),
          appBarTheme:
              const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light, 
              iconTheme: IconThemeData(color: MyColors.primaryColor, ),
              
              ),
          colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryColor),
          useMaterial3: true,
        ),
        home: child,
      ),
      child: const Homeview(),
    );
  }
}
