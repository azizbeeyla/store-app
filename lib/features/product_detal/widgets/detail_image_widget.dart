import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_color.dart';
import '../../../data/model/product_detail_model.dart';

class DetailImageWidget extends StatelessWidget {
  final DetailModel detail;
  const DetailImageWidget({required this.detail, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          height: 368.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: NetworkImage(detail.productImages.first.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 16.h,
          right: 16.w,
          child: Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              detail.isLiked ? Icons.favorite : Icons.favorite_border,
              color: detail.isLiked ? Colors.red : AppColors.primary,
              size: 18.sp,
            ),
          ),
        ),

      ],
    );
  }
}
