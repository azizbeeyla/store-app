import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/features/common/widgets/custom_text_button.dart';

import '../../../core/utils/app_color.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText,
    this.onPressed = _defaultOnPressed,
  });

  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onPressed;

  static void _defaultOnPressed() {}

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/Check-duotone.svg',
              width: 78.w,
              height: 78.h,
            ),
            SizedBox(height: 16.h),
            Text(
              title,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 20.sp,
                fontFamily: "GeneralSans",
                fontWeight: FontWeight.w600,
                height: 1.2, // line height
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              message,
              style: TextStyle(
                color: AppColors.greyText,
                fontWeight: FontWeight.w500,
                fontFamily: 'GeneralSans',
                fontSize: 16.sp,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            CustomTextButton(
              title: buttonText,
              titleColor: AppColors.white,
              backgroundColor: AppColors.primary,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
