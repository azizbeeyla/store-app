import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final token = await _secureStorage.read(key: "token");

    await Future.delayed(const Duration(seconds: 4));

    if (!mounted) return;

    if (token != null && token.isNotEmpty) {
      context.go(Routes.paymentCard);
    } else {
      context.go(Routes.onboarding);
    }
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
