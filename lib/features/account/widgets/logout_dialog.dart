import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/interceptor.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/common/widgets/custom_text_button.dart';
import '../../../core/utils/app_color.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 341.w,
        height: 336.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 131, right: 131, top: 24),
              child: SvgPicture.asset(
                "assets/WarningCircle.svg",
                width: 64.w,
                height: 64.h,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Logout?",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: "GeneralSans",
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Are you sure you want to logout?",
              style: TextStyle(
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontFamily: "GeneralSans",
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0,right: 24),
              child: CustomTextButton(
                title: "Yes, Logout",
                backgroundColor: Color(0xFFED1010),
                onPressed: () async {
                  await context.read<AuthInterceptor>().logout();
                  context.go(Routes.login);
                },

                titleColor: AppColors.white,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24),
              child: CustomTextButton(
                borderColor: AppColors.grey,
                title: "No, Cancel",
                backgroundColor: AppColors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
                titleColor: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
