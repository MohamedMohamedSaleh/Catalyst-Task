import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shimar_widget.dart';

Widget usersLoadingWidget() => Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Row(
            children: [
              const SizedBox(
                width: 18,
              ),
              ShimmerWidget.rectangular(
                height: 30.h,
                width: 70.w,
                shapeBorder: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              ShimmerWidget.rectangular(
                height: 30.h,
                width: 65.w,
                shapeBorder: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              ShimmerWidget.rectangular(
                height: 30.h,
                width: 65.w,
                shapeBorder: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              ShimmerWidget.rectangular(
                height: 30.h,
                width: 65.w,
                shapeBorder: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
        
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                itemBuilder: (context, index) => ShimmerWidget.rectangular(
                      height: 115.h,
                      shapeBorder: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: 6),
          ),
        ],
      ),
    );

// Widget categoryShimmerLoading() => Column(
//       children: [
//         ShimmerWidget.rectangular(
//           height: 35,
//           width: 60,
//           shapeBorder: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(9),
//           ),
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         ShimmerWidget.rectangular(
//           height: 16,
//           width: 50,
//           shapeBorder: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(7),
//           ),
//         )
//       ],
//     );

// Widget sliderShimmerLoading() => Column(
//       children: [
//         const ShimmerWidget.rectangular(
//           height: 150,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ...List.generate(
//               5,
//               (index) => const Padding(
//                 padding: EdgeInsets.only(left: 4),
//                 child: ShimmerWidget.circular(
//                   width: 8,
//                   height: 8,
//                 ),
//               ),
//             ),
//           ],
//         )
//       ],
//     );
