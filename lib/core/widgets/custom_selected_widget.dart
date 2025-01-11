import 'package:catalyst_task/core/constants/app_images.dart';
import 'package:catalyst_task/core/constants/my_colors.dart';
import 'package:catalyst_task/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSelectedWidget extends StatefulWidget {
  const CustomSelectedWidget({
    super.key,
    this.validator,
    required this.lableText,
    required this.onChanged,
    this.role,
  });

  final String lableText;
  final ValueChanged<String?> onChanged;
  final String? role;

  final String? Function(String?)? validator;

  @override
  State<CustomSelectedWidget> createState() => _CustomSelectedWidgetState();
}

class _CustomSelectedWidgetState extends State<CustomSelectedWidget> {
  List<String> selectList = ['Admin', "Owner", "Client"];
  String? _selectedValue;
  @override
  void initState() {
    if (widget.role == "admin") {
      _selectedValue = selectList[0];
    } else if (widget.role == "owner") {
      _selectedValue = selectList[1];
    } else if (widget.role == "client") {
      _selectedValue = selectList[2];
    } else {
      _selectedValue = null; // or you can set it to 'Admin' for example.
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
     
      validator: widget.validator,
      borderRadius: BorderRadius.circular(15.r),
      items: selectList.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      alignment: Alignment.bottomCenter,
      
      dropdownColor: const Color.fromARGB(255, 213, 193, 249),
      onChanged: (value) {
        if (value != null) {
          setState(() {
            _selectedValue = value;
          });
          widget.onChanged(value);
        }
      },
      style: TextStyle(
        color: MyColors.primaryColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      value: _selectedValue,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: AppImage(
            Assets.imagesManagement,
            color: MyColors.primaryColor,
            height: 20.h,
          ),
        ),
        contentPadding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10).w,
        labelStyle: TextStyle(
          color: MyColors.primaryColor,
          fontSize: 14.sp,
        ),
        labelText: widget.lableText,
      ),
    );
  }
}
