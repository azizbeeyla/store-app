import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/app_color.dart';

class NotificationEmptyWidget extends StatelessWidget {
  const NotificationEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/Bell-duotone.svg'),

        SizedBox(
          height: 30.h,
        ),
        Text(
          "You haven’t gotten\n any notifications yet!",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            fontFamily: "GeneralSans",
            fontSize: 20.sp,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          "We’ll alert you when something\n cool happens.",
          style: TextStyle(
            color: AppColors.greyText,
            fontFamily: "GeneralSans",
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
