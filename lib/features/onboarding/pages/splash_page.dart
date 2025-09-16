import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/app_color.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4),(){

context.go(Routes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Positioned(
            top: 40.h,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/splash_vector.svg',
              width: 390.w,
              fit: BoxFit.cover,
            ),
          ),

          Center(
            child: SvgPicture.asset(
              'assets/splash_element.svg',
              width: 134.w,
              height: 133.h,
            ),
          ),
        ],
      ),
    );
  }
}
