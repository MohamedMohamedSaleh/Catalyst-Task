import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/my_colors.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  final Color? color;

  const ShimmerWidget.rectangular({
    super.key,
    this.shapeBorder = const RoundedRectangleBorder(),
    this.width = double.infinity,
    required this.height,
    this.color,
  });
  const ShimmerWidget.circular({
    super.key,
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: color == null ? MyColors.primaryColor.withOpacity(.5) : color!,
      highlightColor: MyColors.primaryColor.withOpacity(.30),
      child: Container(
        height: height,
        width: width,
        decoration: ShapeDecoration(
          shape: shapeBorder,
          color: color == null ? MyColors.primaryColor.withOpacity(.5) : color!,
        ),
      ),
    );
  }
}