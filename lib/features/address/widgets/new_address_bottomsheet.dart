import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/features/address/managers/address_event.dart';
import 'package:store_app/features/common/widgets/custom_text_button.dart';

import '../../../data/model/address_model.dart';
import '../managers/address_bloc.dart';

class NewAddressBottomSheet extends StatefulWidget {
  final String fullAddress;
  final LatLng latLng;

  const NewAddressBottomSheet({
    super.key,
    required this.fullAddress,
    required this.latLng,
  });

  @override
  State<NewAddressBottomSheet> createState() => _NewAddressBottomSheetState();
}

class _NewAddressBottomSheetState extends State<NewAddressBottomSheet> {
  final  nicknameController = TextEditingController();
  bool isDefault = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 510,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Address',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontFamily: 'GeneralSans',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset('assets/Cancel.svg'),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),

            Divider(
              color: AppColors.primary100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Address Nickname',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                fontFamily: 'GeneralSans',
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            TextField(
              controller: nicknameController,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset('assets/Chevron.svg'),
                ),

                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary100, width: 1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Full Address',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                fontFamily: 'GeneralSans',
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary100, width: 1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                hintText: widget.fullAddress,
              ),
            ),

            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isDefault = !isDefault;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: isDefault ? AppColors.primary : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                    child: isDefault
                        ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    )
                        : null,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    "Make this my default address",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'GeneralSans',
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h,),

            CustomTextButton(
              title: "Add",
              backgroundColor: AppColors.primary,
              titleColor: AppColors.white,
              onPressed: (){
                final model = AddressModel(
                  id: 0,
                  title: nicknameController.text.trim(),
                  fullAddress: widget.fullAddress,
                  lat: widget.latLng.latitude,
                  lng: widget.latLng.longitude,
                  isDefault: isDefault,
                );

                context.read<AddressBloc>().add(NewAddressEvent(model));
                Navigator.pop(context);
              }
              )
          ],
        ),
      ),
    );
  }
}
