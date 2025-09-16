import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_color.dart';

class AlreadyAccountText extends StatelessWidget {
  final String prefixText;
  final String actionText;
  final VoidCallback? onActionTap;

  const AlreadyAccountText({
    super.key,
    required this.prefixText,
    required this.actionText,
    this.onActionTap,
  });

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
          TextSpan(text: prefixText),
          TextSpan(
            text: actionText,
            style: TextStyle(
              fontFamily: "GeneralSans",
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              height: 1.4,
              decoration: TextDecoration.underline,
              color: AppColors.primary,
            ),
            recognizer: TapGestureRecognizer()..onTap = onActionTap,
          ),
        ],
      ),
    );
  }
}
