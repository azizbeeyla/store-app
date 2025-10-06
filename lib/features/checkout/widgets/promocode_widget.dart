import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_color.dart';

class PromoCodeWidget extends StatelessWidget {
  const PromoCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 52.h,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Enter promo code",
                hintStyle: TextStyle(
                  color: AppColors.primary100,
                  fontFamily: "GeneralSans",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    "assets/Discount.svg",
                    width: 20,
                    height: 20,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        TextButton(
          style: TextButton.styleFrom(
            fixedSize: Size(84.w, 52.h),
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: Text(
            "Add",
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontFamily: "GeneralSans",
            ),
          ),
        ),
      ],
    );
  }
}
