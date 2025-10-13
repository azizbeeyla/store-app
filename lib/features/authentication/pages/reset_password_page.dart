import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/features/authentication/widgets/custom_textfield.dart';
import 'package:store_app/features/common/widgets/appbar_leading.dart';
import 'package:store_app/features/common/widgets/custom_text_button.dart';
import 'package:store_app/features/authentication/widgets/text_detail_widget.dart';
import '../../../data/model/auth_model/reset_password_reset.dart';
import '../managers/auth_bloc.dart';
import '../managers/auth_event.dart';
import '../managers/auth_state.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() => setState(() {}));
    _confirmController.addListener(() => setState(() {}));
  }

  bool get _isValid =>
      _passwordController.text.isNotEmpty &&
      _passwordController.text.length >= 6 &&
      _passwordController.text == _confirmController.text;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarLeading(onPressed: () => context.pop()),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
        ),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.errorResetPassword != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorResetPassword!)),
              );
            } else if (state.isLoadingResetPassword == false && _isValid) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Password changed successfully")),
              );
              context.go(Routes.login);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextDetailWidget(
                  title: "Reset Password",
                  description:
                      "Enter your new password and confirm it to reset your account password.",
                ),
                const SizedBox(height: 24),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _passwordController,
                        label: "New Password",
                        isPassword: true,
                        hintText: '',
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _confirmController,
                        label: "Confirm Password",
                        hintText: '12345678',
                        isPassword: true,
                        externalValidator: (val) {
                          if (val != _passwordController.text)
                            return "Passwords do not match";
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: CustomTextButton(
                    title: state.isLoadingResetPassword == true
                        ? "Resetting..."
                        : "Reset Password",
                    backgroundColor: AppColors.primary,
                    titleColor: AppColors.white,
                    onPressed:
                        !_isValid || (state.isLoadingResetPassword ?? false)
                        ? null
                        : () {
                            if (_formKey.currentState?.validate() ?? false) {
                              final email = state.forgotEmail;
                              final code = state.forgotCode;
                              if (email != null && code != null) {
                                context.read<AuthBloc>().add(
                                  ResetForgotPassword(
                                    ResetPasswordResetModel(
                                      email: email,
                                      code: code,
                                      password: _passwordController.text,
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
