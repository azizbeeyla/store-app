import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/data/model/cart_model.dart';

import '../managers/my_cart_bloc.dart';
import '../managers/my_cart_event.dart';

class MyCartItemWidget extends StatelessWidget {
  final CartItem item;

  const MyCartItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.primary100),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.network(
                item.image,
                width: 83.w,
                height: 79.h,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'GeneralSans',
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Size ${item.size}',
                    style: TextStyle(
                      color: AppColors.greyText,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'GeneralSans',
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "\$ ${item.price}",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'GeneralSans',
                    ),
                  ),
                ],
              ),
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {
                    context.read<CartBloc>().add(RemoveFromCart(item.id));
                  },
                  icon: SvgPicture.asset('assets/Trash.svg'),
                ),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    GestureDetector(
                      onTap: () {
                        if (item.quantity > 1) {
                          context.read<CartBloc>().add(RemoveFromCart(item.id));
                        } else {
                          context.read<CartBloc>().add(RemoveFromCart(item.id));
                        }
                      },
                      child: Container(
                        width: 23.w,
                        height: 23.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: AppColors.primary200,
                            width: 0.7,
                          ),
                        ),
                        child: SvgPicture.asset('assets/Minus.svg'),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        "${item.quantity}",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'GeneralSans',
                        ),
                      ),
                    ),


                    GestureDetector(
                      onTap: () {
                          context.read<CartBloc>().add(
                            AddToCart(
                              productId: item.productId,
                              sizeId: item.sizeId,
                            ),
                          );
                      },
                      child: Container(
                        width: 23.w,
                        height: 23.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: AppColors.primary200,
                            width: 0.7,
                          ),
                        ),
                        child: SvgPicture.asset('assets/Plus.svg'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
