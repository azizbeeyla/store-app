import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/features/common/widgets/appbar_leading.dart';
import 'package:store_app/features/common/widgets/custom_text_button.dart';
import 'package:store_app/features/authentication/widgets/text_detail_widget.dart';
import '../../../data/model/auth_model/reset_password_verify.dart';
import '../../../data/model/auth_model/reset_password_email.dart';
import '../managers/auth_bloc.dart';
import '../managers/auth_event.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../managers/auth_state.dart';

class ResetCodePage extends StatefulWidget {
  const ResetCodePage({super.key});

  @override
  State<ResetCodePage> createState() => _ResetCodePageState();
}

class _ResetCodePageState extends State<ResetCodePage> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    final bool isFull = code.length == 4;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarLeading(onPressed: () => context.pop()),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.errorVerifyCode != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorVerifyCode!)),
              );
            } else if (state.isLoadingVerifyCode == false && isFull) {
              context.push(Routes.resetPassword);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextDetailWidget(
                  title: "Enter Code",
                  description:
                  "We sent a 4-digit code to your email (${state.forgotEmail ?? 'your email'}). Please enter it below.",
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    onChanged: (val) => setState(() => code = val),
                    autoFocus: true,
                    keyboardType: TextInputType.number,
                    cursorColor: AppColors.primary,
                    textStyle: TextStyle(
                      fontSize: 22.sp,
                      fontFamily: 'GeneralSans',
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: AppColors.primary, fontSize: 14.sp),
                      children: [
                        const TextSpan(text: "Didn’t receive the code? "),
                        TextSpan(
                          text: "Resend",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              final email = state.forgotEmail;
                              if (email != null && email.isNotEmpty) {
                                context.read<AuthBloc>().add(
                                  SendForgotEmail(
                                    ResetPasswordEmailModel(email: email),
                                  ),
                                );
                              }
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: CustomTextButton(
                    title: state.isLoadingVerifyCode == true
                        ? "Verifying..."
                        : "Continue",
                    backgroundColor: AppColors.primary,
                    titleColor: AppColors.white,
                    onPressed: !isFull || (state.isLoadingVerifyCode ?? false)
                        ? null
                        : () {
                      final email = state.forgotEmail;
                      if (email != null && email.isNotEmpty) {
                        context.read<AuthBloc>().add(
                          VerifyForgotCode(
                            ResetPasswordVerifyModel(
                              email: email,
                              code: code,
                            ),
                          ),
                        );
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
