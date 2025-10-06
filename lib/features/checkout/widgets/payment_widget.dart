import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import '../../../core/utils/app_color.dart';
import '../../../data/model/payment_model/card_model.dart';
class PaymentWidget extends StatelessWidget {
  const PaymentWidget({
    super.key,
    required this.selectedCard,
  });

  final CardModel? selectedCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary100),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/Card-duotone.svg"),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              "**** **** **** ${selectedCard!.cardNumber.substring(selectedCard!.cardNumber.length - 4)}",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
                color: AppColors.primary,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.push(Routes.paymentCard);
            },
            child: SvgPicture.asset("assets/Edit.svg"),
          ),
        ],
      ),
    );
  }
}
