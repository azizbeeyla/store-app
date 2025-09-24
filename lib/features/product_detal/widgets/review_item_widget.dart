import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_color.dart';
import '../../../data/model/review_model.dart';

class ReviewItemWidget extends StatelessWidget {
  final ReviewModel review;
  const ReviewItemWidget({required this.review, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.greyText,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(5, (i) => i < review.rating
                ? SvgPicture.asset('assets/Star.svg', width: 16.w, height: 16.h)
                : SvgPicture.asset('assets/Star.svg', width: 16.w, height: 16.h,color: AppColors.grey,),
            ),
          ),
          SizedBox(height: 6.h),
          Text(review.comment, style: TextStyle()),
          SizedBox(height: 4.h),
          // // Text("${review.userFullName} • ${DateFormat('d MMM, HH:mm').format(DateTime.parse(review.created))}",
          //     style: TextStyle()),
        ],
      ),
    );
  }
}
