import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_color.dart';

class AlreadyAccountText extends StatelessWidget {
  const AlreadyAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontFamily: "GeneralSans",
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          height: 1.4,
          color: AppColors.primary,
        ),
        children: [
          const TextSpan(text: "Already have an account? "),
          TextSpan(
            text: "Log In",
            style: TextStyle(
              fontFamily: "GeneralSans",
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              height: 1.4,
              decoration: TextDecoration.underline,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
