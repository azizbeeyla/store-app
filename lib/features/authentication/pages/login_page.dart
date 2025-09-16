// login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store_app/features/authentication/widgets/already_text.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/app_color.dart';
import '../../../data/model/auth_model/login_model.dart';
import '../../../data/repository/auth_repository.dart';
import '../../common/widgets/custom_text_button.dart';
import '../managers/login_view_model.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/text_detail_widget.dart';
import '../widgets/or_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
 
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late final LoginViewModel _viewModel;
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
      _viewModel = LoginViewModel(authRepo: repo);
      _vmInitialized = true;
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>.value(
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

                  Consumer<LoginViewModel>(
                    builder: (context, vm, child) {
                      return CustomTextButton(
                        title: vm.isLoading ? "Loading..." : "Login",
                        backgroundColor: isFormValid
                            ? AppColors.primary
                            : AppColors.grey,
                        titleColor: AppColors.white,
                        borderColor: isFormValid ? null : AppColors.textColor,
                        onPressed: isFormValid && !vm.isLoading
                            ? () async {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  final model = LoginModel(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  await vm.login(model);

                                  if (vm.success) {
                                    context.go(Routes.signup);
                                  } else if (vm.error != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(vm.error!)),
                                    );
                                  }
                                }
                              }
                            : null,
                      );
                    },
                  ),

                  SizedBox(height: 24.h),
                  OrWidget(),
                  SizedBox(height: 24.h),
                  CustomTextButton(
                    title: "Login with Google",
                    backgroundColor: AppColors.white,
                    titleColor: AppColors.primary,
                    borderColor: AppColors.grey,
                    leftIcon: 'assets/logos_google-icon.svg',
                  ),
                  SizedBox(height: 16.h),
                  CustomTextButton(
                    title: "Login with Facebook",
                    backgroundColor: AppColors.blue,
                    titleColor: AppColors.white,
                    leftIcon: 'assets/logos_facebook.svg',
                  ),

                  SizedBox(height: 164.h),
                  Center(
                    child: AlreadyAccountText(
                      prefixText: "Don’t have an account? ",
                      actionText: "Join",
                    ),
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
