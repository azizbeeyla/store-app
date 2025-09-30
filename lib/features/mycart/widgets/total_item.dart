  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:store_app/core/utils/app_color.dart';
  import 'package:store_app/data/model/cart_model.dart';
  import 'package:store_app/features/mycart/widgets/custom_row_total.dart';

  class TotalItem extends StatelessWidget {
    final CartModel item;

    const TotalItem({super.key, required this.item});

    @override
    Widget build(BuildContext context) {
      return Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          CustomRowTotal(
            title: 'Sub-total',
            items: item.subTotal,
          ),
          CustomRowTotal(
            title: 'VAT(%)',
            items: item.vat,
          ),
          CustomRowTotal(
            title: 'Shipping fee',
            items: item.shippingFee,
          ),
          Divider(
            color: AppColors.primary100,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  fontFamily: 'GeneralSans',
                ),
              ),

              Text(
                "\$${item.total}",
                style: TextStyle(
                  color: AppColors.primary,
                  fontFamily: 'GeneralSans',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
