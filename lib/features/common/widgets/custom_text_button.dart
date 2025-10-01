import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class CustomTextButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final String? leftIcon;
  final Color titleColor;

  final String? rightIcon;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final bool isDisabled;
  const CustomTextButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    this.leftIcon,
    this.rightIcon,
    this.onPressed,
    required this.titleColor,
    this.borderColor,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 341.w,
      height: 54.h,
      child: TextButton(
        style: TextButton.styleFrom(
          side: borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
          backgroundColor: isDisabled
              ? Colors.grey.shade400
              : backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leftIcon != null) ...[
              SvgPicture.asset(leftIcon!, width: 20.w, height: 20.h),
              SizedBox(width: 10.w),
            ],
            Text(
              title,
              style: TextStyle(
                color: titleColor,
                fontSize: 16.sp,
                fontFamily: "GeneralSans",
                fontWeight: FontWeight.w500,
              ),
            ),
            if (rightIcon != null) ...[
              SizedBox(width: 10.w),
              SvgPicture.asset(rightIcon!, width: 20.w, height: 20.h),
            ],
          ],
        ),
      ),
    );
  }
}
