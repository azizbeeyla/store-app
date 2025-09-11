import 'package:flutter/material.dart';
import 'package:store_app/core/utils/AppColors.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 59.0, left: 24),
        child: Stack(
          children: [
            Text(
              "Define yourself in your unique way.",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 64,
                fontWeight: FontWeight.w600,
                fontFamily: "GeneralSans",
                height: 0.8
              ),

            ),

          ],
        ),
      ),
    );
  }
}
