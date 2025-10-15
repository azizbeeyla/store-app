import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_color.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String time;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isMe,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6.h),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isMe ? AppColors.primary : AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14.r),
            topRight: Radius.circular(14.r),
            bottomLeft: Radius.circular(isMe ? 14.r : 0),
            bottomRight: Radius.circular(isMe ? 0 : 14.r),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
            fontFamily: "GeneralSans",
            color: isMe ? Colors.white : AppColors.primary,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
