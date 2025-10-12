import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/app_color.dart';
import '../../../data/model/auth_model/register_model.dart';
import '../../common/widgets/custom_text_button.dart';
import '../managers/auth_bloc.dart';
import '../managers/auth_event.dart';
import '../managers/auth_state.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/text_detail_widget.dart';
import '../widgets/or_widget.dart';
import '../widgets/already_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
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
    nameController.dispose();
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
          if (state.signupError != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.signupError!)),
            );
          } else if (state.signupSuccess == true) {
            context.push(Routes.login);
          }
        },
        builder: (context, state) {
          final isLoading = state.isSignupLoading ?? false;

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
                      title: 'Create an account',
                      description: "Let’s create your account.",
                    ),
                    SizedBox(height: 16.h),

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

                    SizedBox(height: 24.h),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: CustomTextButton(
                        title:
                        isLoading ? "Loading..." : "Create an Account",
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
                            final model = AuthModel(
                              fullName:
                              nameController.text.trim(),
                              email: emailController.text.trim(),
                              password:
                              passwordController.text.trim(),
                            );

                            context
                                .read<AuthBloc>()
                                .add(RegisterRequested(model));
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
                        title: "Sign Up with Google",
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
                        title: "Sign Up with Facebook",
                        backgroundColor: AppColors.blue,
                        titleColor: AppColors.white,
                        leftIcon: 'assets/logos_facebook.svg',
                      ),
                    ),

                    SizedBox(height: 48.h),
                    Center(
                      child: AlreadyAccountText(
                        onActionTap: () {
                          context.push(Routes.login);
                        },
                        prefixText: 'Already have an account?',
                        actionText: 'Log In',
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
