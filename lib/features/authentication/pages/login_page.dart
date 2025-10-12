import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/data/model/auth_model/login_model.dart';
import 'package:store_app/features/authentication/widgets/already_text.dart';
import 'package:store_app/features/common/widgets/custom_text_button.dart';
import 'package:store_app/features/authentication/widgets/custom_textfield.dart';
import 'package:store_app/features/authentication/widgets/text_detail_widget.dart';
import 'package:store_app/features/authentication/widgets/or_widget.dart';

import '../managers/auth_bloc.dart';
import '../managers/auth_event.dart';
import '../managers/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isFormValid = false;

  void _validateForm() {
    setState(() {
      isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBody: true,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.loginError != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.loginError!)),
            );
          } else if (state.loginSuccess == true) {
            context.go(Routes.homePage);
          }
        },
        builder: (context, state) {
          final isLoading = state.isLoginLoading ?? false;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 59.0),
              child: Form(
                key: _formKey,
                onChanged: _validateForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextDetailWidget(
                      title: 'Login to Your Account',
                      description: "It’s great to see you again.",
                    ),
                    SizedBox(height: 16.h),
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
                    SizedBox(height: 10.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: AlreadyAccountText(
                        prefixText: "Forgot your password? ",
                        actionText: "Reset your password",
                        onActionTap: () {
                          context.push(Routes.forgotPassword);
                        },
                      ),
                    ),

                    SizedBox(height: 24.h),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: CustomTextButton(
                        title: isLoading ? "Loading..." : "Login",
                        backgroundColor: isFormValid
                            ? AppColors.primary
                            : AppColors.grey,
                        titleColor: AppColors.white,
                        borderColor:
                        isFormValid ? null : AppColors.textColor,
                        onPressed: isFormValid && !isLoading
                            ? () {
                          if (_formKey.currentState?.validate() ??
                              false) {
                            final model = LoginModel(
                              email: emailController.text.trim(),
                              password:
                              passwordController.text.trim(),
                            );

                            context
                                .read<AuthBloc>()
                                .add(LoginRequested(model));
                          }
                        }
                            : null,
                      ),
                    ),

                    SizedBox(height: 24.h),
                    const OrWidget(),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: CustomTextButton(
                        title: "Login with Google",
                        backgroundColor: AppColors.white,
                        titleColor: AppColors.primary,
                        borderColor: AppColors.grey,
                        leftIcon: 'assets/logos_google-icon.svg',
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: CustomTextButton(
                        title: "Login with Facebook",
                        backgroundColor: AppColors.blue,
                        titleColor: AppColors.white,
                        leftIcon: 'assets/logos_facebook.svg',
                      ),
                    ),

                    SizedBox(height: 164.h),
                    Center(
                      child: AlreadyAccountText(
                        onActionTap: () {
                          context.go(Routes.signup);
                        },
                        prefixText: "Don’t have an account? ",
                        actionText: "Join",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
