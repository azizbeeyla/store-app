import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_color.dart';
import '../../../data/model/address_model.dart';

class AddressWidget extends StatelessWidget {
  final AddressModel address;
  final int? selectedId;
  final Function(int) onSelected;

  const AddressWidget({
    super.key,
    required this.address,
    required this.selectedId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.primary100),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 16),
          child: Row(
            children: [
              SvgPicture.asset("assets/Location.svg"),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          address.title,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontFamily: "GeneralSans",
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(width: 2.w),

                        address.isDefault
                            ? Container(
                                width: 52.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColors.primary100,
                                ),
                                child: Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Default",
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp,
                                      fontFamily: 'GeneralSans',
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                    Text(
                      address.fullAddress,
                      style: TextStyle(
                        color: AppColors.greyText,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: "GeneralSans",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 18.w),
              Radio<int>(
                activeColor: AppColors.primary,
                value: address.id,
                groupValue: selectedId,
                onChanged: (val) {
                  if (val != null) {
                    onSelected(val);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
