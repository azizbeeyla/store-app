import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/features/authentication/widgets/custom_textfield.dart';
import 'package:store_app/features/authentication/widgets/text_detail_widget.dart';
import 'package:store_app/features/common/widgets/appbar_leading.dart';
import 'package:store_app/features/common/widgets/custom_text_button.dart';
import '../../../data/model/auth_model/reset_password_email.dart';
import '../managers/auth_view_model.dart';

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

  void _sendCode(AuthViewModel viewModel) async {
    if (_formKey.currentState?.validate() ?? false) {
      final email = emailController.text.trim();
      try {
        await viewModel.fetchForgotEmail(
          model: ResetPasswordEmailModel(email: email),
        );

        if (viewModel.emailError == null) {
          context.push(Routes.resetCode);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(viewModel.emailError!)),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Something went wrong: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarLeading(
        onPressed: () => context.pop(),
      ),
      body: SingleChildScrollView(
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
                hintText: "Enter Your Email",
                controller: emailController,
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: CustomTextButton(
                  title: authViewModel.isLoadingEmail ? "Sending..." : "Send Code",
                  backgroundColor: AppColors.primary,
                  titleColor: AppColors.white,
                  onPressed: authViewModel.isLoadingEmail
                      ? null
                      : () => _sendCode(authViewModel),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
