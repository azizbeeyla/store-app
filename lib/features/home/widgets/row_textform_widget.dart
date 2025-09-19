import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/app_color.dart';

class RowTextFormWidget extends StatelessWidget {
  const RowTextFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 281.w,
          height: 52.h,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Search for clothes...",
              hintStyle: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              prefixIcon: SvgPicture.asset(
                "assets/Search.svg",
                fit: BoxFit.scaleDown,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.hintColor,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Container(
          width: 52.w,
          height: 52.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primary,
          ),
          child: SvgPicture.asset(
            "assets/Filter.svg",
            fit: BoxFit.scaleDown,
          ),
        ),
      ],
    );
  }
}
