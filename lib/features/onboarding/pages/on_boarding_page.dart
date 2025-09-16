import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/common/widgets/custom_text_button.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/app_color.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 59.0, ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                "Define yourself in your unique way.",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 64,
                  fontWeight: FontWeight.w600,
                  fontFamily: "GeneralSans",
                  height: 0.8,
                ),
              ),
            ),
            SvgPicture.asset('assets/onboarding_vector.svg', width: 390.w),

            Align(
              alignment: Alignment.topRight,
              child: Image.asset('assets/human.png'),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 107.h,
                decoration: BoxDecoration(color: AppColors.white),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 31.0),
                child: CustomTextButton(
                  onPressed: () {
                    context.go(Routes.signup);
                  },
                  title: "Get Started",
                  backgroundColor: AppColors.primary,
                  titleColor: AppColors.white,
                  rightIcon: "assets/arrow-right.svg",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
