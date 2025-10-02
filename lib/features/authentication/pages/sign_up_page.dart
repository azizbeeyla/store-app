// sign_up_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/app_color.dart';
import '../../../data/model/auth_model/register_model.dart';
import '../../../data/repository/auth_repository.dart';
import '../../common/widgets/custom_text_button.dart';
import '../managers/register_view_model.dart';
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

  late final RegisterViewModel _viewModel;
  bool _vmInitialized = false;
  bool isFormValid = false;

  void _validateForm() {
    setState(() {
      isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_vmInitialized) {
      final repo = Provider.of<AuthRepository>(context, listen: false);
      _viewModel = RegisterViewModel(registerRepo: repo);
      _vmInitialized = true;
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterViewModel>.value(
      value: _viewModel,
      child: Scaffold(
        backgroundColor: AppColors.white,
        extendBody: true,
        body: SingleChildScrollView(
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

                  SizedBox(height: 24.h),

                  Consumer<RegisterViewModel>(
                    builder: (context, vm, child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: CustomTextButton(
                          title: vm.isLoading ? "Loading..." : "Create an Account",
                          backgroundColor:
                          isFormValid ? AppColors.primary : AppColors.grey,
                          titleColor: AppColors.white,
                          borderColor: isFormValid ? null : AppColors.textColor,
                          onPressed: isFormValid && !vm.isLoading
                              ? () async {
                            if (_formKey.currentState!.validate()) {
                              final model = AuthModel(
                                fullName: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              await vm.register(model);

                              if (vm.success) {
                                context.push(Routes.login);
                              } else if (vm.error != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(vm.error!)),
                                );
                              }
                            }
                          }
                              : null,
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 24.h),
                  OrWidget(),
                  SizedBox(height: 24.h,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: CustomTextButton(
                      title: "Sign Up with Google ",
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

                      title: "Sign Up with Facebook ",
                      backgroundColor: AppColors.blue,
                      titleColor: AppColors.white,
                      leftIcon: 'assets/logos_facebook.svg',
                    ),
                  ),
                  SizedBox(height: 48.h),

                  Center(
                    child: AlreadyAccountText(onActionTap: () {
                      context.push(Routes.login);
                    }, prefixText: 'Already have an account?', actionText: 'Log In',),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
