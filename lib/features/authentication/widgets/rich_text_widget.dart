import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_color.dart';

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          style: TextStyle(
            fontFamily: "GeneralSans",
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            height: 1.4,
            color: AppColors.primary,
          ),
          children: [
            const TextSpan(text: "By signing up you agree to our "),
            TextSpan(
              text: "Terms",
              style: TextStyle(
                fontFamily: "GeneralSans",
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                height: 1.4,
                decoration: TextDecoration.underline,
              ),
            ),
            const TextSpan(text: ", "),
            TextSpan(
              text: "Privacy Policy",
              style: TextStyle(
                fontFamily: "GeneralSans",
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                height: 1.4,
                decoration: TextDecoration.underline,
              ),
            ),
            const TextSpan(text: ", and "),
            TextSpan(
              text: "Cookie Use",
              style: TextStyle(
                fontFamily: "GeneralSans",
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                height: 1.4,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
