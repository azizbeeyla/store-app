import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/utils/app_color.dart';

import '../../../data/model/product_detail_model.dart';

class DetailInfoWidget extends StatelessWidget {
  final DetailModel detail;

  const DetailInfoWidget({required this.detail, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          detail.title,
          style: TextStyle(
            fontFamily: "GeneralSans",
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
            color: AppColors.primary,
          ),
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/Star.svg',
              color: Color(0xFFFFA928),
            ),
            SizedBox(width: 6.w),
            Text(
              "${detail.rating.toStringAsFixed(1)}/5",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "GeneralSans",
              ),
            ),
            SizedBox(width: 6.w),
            Text(
              "(${detail.reviewsCount} reviews)",
              style: TextStyle(
                color: AppColors.greyText,
                fontFamily: "GeneralSans",
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 13.h),
        Text(
          detail.description,
          style: TextStyle(
            color: AppColors.greyText,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'GeneralSans',
            height: 1.4,
            letterSpacing: 0
          ),
        ),
      ],
    );
  }
}
