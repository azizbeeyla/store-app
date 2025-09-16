import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_color.dart';

class TextDetailWidget extends StatelessWidget {
  final String title;
  final String description;

  const TextDetailWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0,right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 32.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "GeneralSan",
              height: 1,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            style: TextStyle(
              color: AppColors.hintColor,
              fontFamily: "GeneralSan",
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
