import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';

import '../../../core/utils/app_color.dart';

class ProductItem extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  final num price;
  final num? discount;
  final bool isLiked;

  final VoidCallback? onLikeTap;
  final VoidCallback? onUnSave;

  final double width;
  final double height;
  final double imageHeight;

  const ProductItem({
    super.key,
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    this.discount,
    required this.isLiked,
    this.onLikeTap,
    this.onUnSave,
    this.width = 161,
    this.height = 224,
    this.imageHeight = 174,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.push('${Routes.detail}/$id');

      },
      child: SizedBox(
        width: width.w,
        height: height.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: imageHeight.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      if (onUnSave != null) {
                        onUnSave!();
                      } else if (onLikeTap != null) {
                        onLikeTap!();
                      }
                    },
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white,
                      ),
                      child: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : AppColors.primary,
                        size: 18.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "GeneralSans",
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Text(
                  "\$$price",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyText,
                  ),
                ),
                if (discount != null && discount! > 0) ...[
                  SizedBox(width: 4.w),
                  Text(
                    "-${discount!}%",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
