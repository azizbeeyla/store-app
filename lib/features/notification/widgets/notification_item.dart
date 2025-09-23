import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/utils/app_color.dart';

class NotificationItem extends StatelessWidget {
  final String? day;
  final String svgIcon;
  final String text;
  final String description;

  const NotificationItem({
    super.key,
    this.day,
    required this.svgIcon,
    required this.text,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0,right: 24,bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 1,
              width: day != null ? double.infinity : 304.w ,
              color: AppColors.grey,
            ),
          ),
          SizedBox(height: 16.h,),

          if (day != null) ...[
            Text(
              day!,
              style:  TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                fontFamily: "GeneralSans"

              ),
            ),
            SizedBox(height: 16.h),
          ],

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.network(svgIcon),
              SizedBox(width: 14.5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style:  TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      fontFamily: "GeneralSans"
                    ),
                  ),
                  Text(
                    description,
                    style:  TextStyle(
                      color: AppColors.greyText,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      fontFamily: "GeneralSans"
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
