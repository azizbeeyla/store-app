import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_color.dart';

class CustomRowTotal extends StatelessWidget {
  final String title;
  final num items;

  const CustomRowTotal({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.greyText,
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            fontFamily: 'GeneralSans',
          ),
        ),

        Text(
          "\$$items",
          style: TextStyle(
            color: AppColors.primary,
            fontFamily: 'GeneralSans',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
