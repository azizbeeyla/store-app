import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/data/model/order_model.dart';

import 'create_rewiew_widget.dart';

class OrderItem extends StatelessWidget {
  final OrderModel orders;

  const OrderItem({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.primary100),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(4.r),
              child: Image.network(
                orders.image,
                width: 83.w,
                height: 79.h,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(
              width: 16.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 213.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        orders.title,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          fontFamily: 'GeneralSans',
                        ),
                      ),
                      Container(
                        height: 20.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: orders.status == "Completed"
                              ? Colors.green
                              : AppColors.primary100,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 3,
                          ),
                          child: Text(
                            orders.status,
                            style: TextStyle(
                              color: orders.status == 'Completed'
                                  ? Color(0xFF0C9409)
                                  : AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Size ${orders.size}",
                  style: TextStyle(
                    color: AppColors.greyText,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    fontFamily: "GeneralSans",
                  ),
                ),
                SizedBox(
                  height: 11.h,
                ),

                SizedBox(
                  width: 213.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${orders.price}",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'GeneralSans',
                        ),
                      ),
                      GestureDetector(
                        onTap: orders.status == "Completed"
                            ? () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) => ReviewBottomSheet(),
                                );
                              }
                            : null,
                        child: Container(
                          height: 30.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: AppColors.primary,
                          ),
                          child: Center(
                            child: Text(
                              orders.status,
                              style: TextStyle(
                                color: AppColors.white,
                                fontFamily: 'GeneralSans',
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
