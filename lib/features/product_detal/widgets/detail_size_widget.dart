  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';

  import '../../../core/utils/app_color.dart';
  import '../../../data/model/product_detail_model.dart';
  import '../managers/detail_cubit.dart';
  import '../managers/detail_state.dart';


  class DetailSizesWidget extends StatelessWidget {
    final List<ProductSize> sizes;
    final ProductSize? selectedSize;
    final ValueChanged<ProductSize> onSelect;

    const DetailSizesWidget({
      required this.sizes,
      required this.onSelect,
      this.selectedSize,
      super.key,
    });

    @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose Size",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontFamily: "GeneralSans",
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 50.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: sizes.length,
              separatorBuilder: (_, __) => SizedBox(width: 10.w),
              itemBuilder: (_, index) {
                final size = sizes[index];
                final isSelected = size == selectedSize;

                return GestureDetector(
                  onTap: () => onSelect(size),
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: isSelected ? AppColors.primary : AppColors.grey,
                        width: isSelected ? 2 : 1,
                      ),
                      color: isSelected ? AppColors.primary.withOpacity(0.1) : null,
                    ),
                    child: Text(
                      size.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isSelected ? AppColors.primary : AppColors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
  }
