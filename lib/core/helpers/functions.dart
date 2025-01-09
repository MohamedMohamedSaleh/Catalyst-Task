import 'package:catalyst_task/core/constants/my_colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';


/// upload image to api and return multipart file
Future uploadImageToAPI(XFile image) async {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}

/// navigator key for navigator
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


/// message type for State of message
enum MessageType { faild, success }






/// show message by snack bar
void showMessage(
    {String? message,
    MessageType type = MessageType.faild,
    double paddingBottom = 50,
    int duration = 2}) {
  if (message!.isNotEmpty) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).removeCurrentSnackBar();
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        duration:  Duration(seconds: duration),
        margin: EdgeInsets.only(right: 30.w, left: 30.w, bottom: paddingBottom),
        behavior: SnackBarBehavior.floating,
        backgroundColor: (type == MessageType.success)
            ? MyColors.primaryColor.withOpacity(.7)
            : Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.r),
        ),
      ),
    );
  }
}