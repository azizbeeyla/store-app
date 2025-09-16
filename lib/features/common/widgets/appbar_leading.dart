import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/app_color.dart';


class AppBarLeading extends StatelessWidget implements PreferredSizeWidget {
  const AppBarLeading({
    super.key,
    this.onPressed });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      leadingWidth: 70,
      leading: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset('assets/back_arrow.svg'),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 56);
}