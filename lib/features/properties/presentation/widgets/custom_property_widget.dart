import 'package:carousel_slider/carousel_slider.dart';
import 'package:catalyst_task/core/helpers/extensions.dart';
import 'package:catalyst_task/features/properties/models/property_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../../core/widgets/app_image.dart';
import '../views/property_details_view.dart';

class CustomPropertyItemWidget extends StatelessWidget {
  const CustomPropertyItemWidget({
    super.key,
    required this.property,
  });
  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return GestureDetector(
      onTap: () {
        context.push(PropertyDetailsView(propertyModel: property));

      },
      child: Card(
        elevation: 1.5,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Slider
            StatefulBuilder(
              builder: (context, setState) {
                return Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    CarouselSlider.builder(
                      itemCount: property.images.length,
                      itemBuilder: (context, index, realIndex) {
                        return AppImage(
                          "https://test.catalystegy.com/public/${property.images[index]}",
                          fit: BoxFit.cover,
                        );
                      },
                      options: CarouselOptions(
                        height: 130.w, // Adjust the height as needed
                        viewportFraction: 1,
                        autoPlay: true, // Enable auto play if you want
                        aspectRatio: 1.0,
                        onPageChanged: (index, reason) => {
                          setState(() {
                            currentIndex = index;
                          })
                        },
                        enableInfiniteScroll: true,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        height: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            property.images.length,
                            (index) => Padding(
                              padding: const EdgeInsetsDirectional.only(end: 4),
                              child: CircleAvatar(
                                radius: (index == currentIndex) ? 3 : 2.5,
                                backgroundColor: (index == currentIndex)
                                    ? Theme.of(context).primaryColor
                                    : MyColors.buttonColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                      color: MyColors.primaryColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    property.description,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                      color: MyColors.primaryColor,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    property.price,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 11.sp,
                      color: MyColors.primaryColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
