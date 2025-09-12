import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/features/authentication/widgets/already_text.dart';
import 'package:store_app/features/authentication/widgets/or_widget.dart';
import 'package:store_app/features/authentication/widgets/custom_textfield.dart';
import 'package:store_app/features/authentication/widgets/text_detail_widget.dart';
import 'package:store_app/features/common/widgets/custom_text_button.dart';

import '../widgets/rich_text_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  bool isFormValid = false;

  void _validateForm() {
    setState(() {
      isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.only(top: 59.0),
        child: Form(
          key: _formKey,
          onChanged: _validateForm,
          child: Column(
            children: [
              TextDetailWidget(
                title: 'Create an account',
                description: "Let’s create your account.",
              ),
              SizedBox(height: 16),
              CustomTextField(
                label: 'Full Name',
                hintText: "Enter your full name",
                controller: nameController,
              ),
              CustomTextField(
                label: 'Email',
                hintText: "Enter your email address",
                controller: emailController,
              ),
              CustomTextField(
                label: 'Password',
                hintText: "Enter your password",
                controller: passwordController,
                isPassword: true,
              ),
              SizedBox(height: 4.h),
              TermsText(),
              SizedBox(height: 24.h),

              CustomTextButton(
                title: "Create an Account",
                backgroundColor: isFormValid ? AppColors.primary : AppColors.grey,
                titleColor: AppColors.white,
                borderColor: isFormValid ? null : AppColors.textColor,
                onPressed: isFormValid ? () {
                  if (_formKey.currentState!.validate()) {
                  }
                } : null,
              ),

              SizedBox(height: 24.h),
              OrWidget(),
              SizedBox(height: 24.h),

              CustomTextButton(
                title: "Sign Up with Google ",
                backgroundColor: AppColors.white,
                titleColor: AppColors.primary,
                borderColor: AppColors.grey,
                leftIcon: 'assets/logos_google-icon.svg',
              ),
              SizedBox(height: 16.h),
              CustomTextButton(
                title: "Sign Up with Facebook ",
                backgroundColor: AppColors.blue,
                titleColor: AppColors.white,
                leftIcon: 'assets/logos_facebook.svg',
              ),
              SizedBox(height: 48.h),
              AlreadyAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
