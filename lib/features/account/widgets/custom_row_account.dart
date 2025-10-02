import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_color.dart';

class CustomRowAccount extends StatelessWidget {
  final String svgICon;
  final String title;
  final bool showDivider;
  final VoidCallback? onPressed;


  const CustomRowAccount({
    super.key,
    required this.svgICon,
    required this.title,
    this.showDivider = true, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 10),
      child: Column(
        children: [
          if (showDivider)
            const Divider(color: AppColors.primary100),
          SizedBox(height: 20.h,),
          GestureDetector(
            onTap: onPressed,
            child: Row(
              children: [
                SvgPicture.asset(svgICon),
                const SizedBox(width: 18),
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontFamily: "GeneralSans",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/right_arrow.svg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
