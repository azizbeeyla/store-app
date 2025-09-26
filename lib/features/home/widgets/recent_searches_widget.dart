import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/app_color.dart';

class RecentSearchesWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const RecentSearchesWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                fontFamily: 'GeneralSans',
              ),
            ),
            IconButton(
              onPressed: onPressed,
              icon: SvgPicture.asset('assets/Cancel-circle.svg'),
            ),
          ],
        ),
        SizedBox(height: 12.h,),

        Divider(color: AppColors.grey,)
      ],
    );
  }
}
