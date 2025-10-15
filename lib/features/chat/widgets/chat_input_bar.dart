import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/app_color.dart';

class ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final bool isScrolling;
  final void Function(String text) onSend;

  const ChatInputBar({
    super.key,
    required this.controller,
    required this.isScrolling,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, -2),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                style: TextStyle(
                  fontFamily: "GeneralSans",
                  fontSize: 14.sp,
                  color: AppColors.primary,
                ),
                decoration: InputDecoration(
                  hintText: "Type a message...",
                  hintStyle: TextStyle(
                    fontFamily: "GeneralSans",
                    color: AppColors.primary.withOpacity(0.5),
                  ),
                  filled: true,
                  fillColor: AppColors.primary.withOpacity(0.05),
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: onSend,
              ),
            ),
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: () => onSend(controller.text),
              child: SvgPicture.asset(
                'assets/Mic.svg',
                width: 24.w,
                colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
