import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_color.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Row(
        spacing: 8,
        children: [
          Container(
            width: 154.w,
            height: 1.h,
            decoration: BoxDecoration(color: AppColors.grey),
          ),
          Text(
            "Or",
            style: TextStyle(
              color: AppColors.greyText,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "GeneralSans",
            ),
          ),
          Container(
            width: 154.w,
            height: 1.h,
            decoration: BoxDecoration(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
