import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_color.dart';

class CustomNotificationWidget extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomNotificationWidget({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: AppColors.primary100,
          ),

          SizedBox(
            height: 16.h,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'GeneralSans',
                ),
              ),
              Switch(
                value: value,
                onChanged: onChanged,
                activeColor: Colors.white,
                activeTrackColor: Colors.black,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey.shade400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
