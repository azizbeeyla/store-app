import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/data/model/auth_model/reset_password_email.dart';
import 'package:store_app/features/authentication/managers/auth_event.dart';
import 'package:store_app/features/authentication/widgets/custom_textfield.dart';
import 'package:store_app/features/authentication/widgets/text_detail_widget.dart';
import 'package:store_app/features/common/widgets/appbar_leading.dart';
import 'package:store_app/features/common/widgets/custom_text_button.dart';

import '../managers/auth_bloc.dart';
import '../managers/auth_state.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _sendCode(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      final model = ResetPasswordEmailModel(email: emailController.text.trim());
      context.read<AuthBloc>().add(SendForgotEmail(model));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarLeading(onPressed: () => context.pop()),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.errorForgotEmail != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorForgotEmail!)),
            );
          } else if (state.isLoadingForgotEmail == false &&
              state.errorForgotEmail == null &&
              state.forgotEmail != null) {
            context.push(Routes.resetCode);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextDetailWidget(
                    title: "Forgot password",
                    description:
                    "Enter your email for the verification process. We will send a 4-digit code to your email.",
                  ),
                  SizedBox(height: 12.h),
                  CustomTextField(
                    label: "Email",
                    hintText: "Enter your email",
                    controller: emailController,
                  ),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: CustomTextButton(
                      title: state.isLoadingForgotEmail == true
                          ? "Sending..."
                          : "Send Code",
                      backgroundColor: AppColors.primary,
                      titleColor: AppColors.white,
                      onPressed: state.isLoadingForgotEmail == true
                          ? null
                          : () => _sendCode(context),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
