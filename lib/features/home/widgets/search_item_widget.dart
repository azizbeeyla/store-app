// search_item_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/utils/app_color.dart';
import '../../../data/model/product_model.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routing/routes.dart';

class SearchItemWidget extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const SearchItemWidget({super.key, required this.product,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  product.image,
                  width: 56.w,
                  height: 53.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      "\$${product.price}",
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset("assets/Arrow.svg"),
            ],
          ),
          SizedBox(height: 10.h),
          Divider(color: AppColors.grey, height: 1),
        ],
      ),
    );
  }
}
