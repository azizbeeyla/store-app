import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_color.dart';
import '../../../data/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;

  final VoidCallback onTap;
  final Color titleColor;
  final Color backgroundColor;

  const CategoryItem({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
    required this.titleColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.hintColor),
        ),
        child: Text(
          category.title,
          style: TextStyle(
            color:titleColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
