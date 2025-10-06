import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_color.dart';
import '../../../data/model/address_model.dart';


class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
    required this.selectedAddress,
  });

  final AddressModel? selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset("assets/Location.svg"),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedAddress!.title ,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                  color: AppColors.primary,
                ),
              ),
              Text(
                selectedAddress!.fullAddress ,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
