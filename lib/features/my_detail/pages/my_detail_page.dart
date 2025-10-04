import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/data/model/user_model.dart';
import 'package:store_app/features/common/widgets/custom_appbar_main.dart';
import 'package:store_app/features/common/widgets/custom_botttom_navigation.dart';
import 'package:store_app/features/common/widgets/custom_text_button.dart';
import '../managers/user_bloc.dart';
import '../managers/user_event.dart';
import '../managers/user_state.dart';
import '../widgets/custom_text_form_widget.dart';
class MyDetailPage extends StatefulWidget {
  const MyDetailPage({super.key});
  @override
  State<MyDetailPage> createState() => _MyDetailPageState();
}
class _MyDetailPageState extends State<MyDetailPage> {
  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    genderController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void _onSubmit(UserModel oldUser) {
    if (_formKey.currentState?.validate() ?? false) {
      final updatedUser = UserModel(
        id: oldUser.id,
        fullName: fullNameController.text.isNotEmpty
            ? fullNameController.text
            : oldUser.fullName,
        email: emailController.text.isNotEmpty
            ? emailController.text
            : oldUser.email,
        phoneNumber: phoneController.text.isNotEmpty
            ? phoneController.text
            : oldUser.phoneNumber,
        gender: genderController.text.isNotEmpty
            ? genderController.text
            : oldUser.gender,
        birthDate: dateController.text.isNotEmpty
            ? DateTime.tryParse(dateController.text)
            : oldUser.birthDate,
      );

      if (updatedUser.fullName == oldUser.fullName &&
          updatedUser.email == oldUser.email &&
          updatedUser.phoneNumber == oldUser.phoneNumber &&
          updatedUser.gender == oldUser.gender &&
          updatedUser.birthDate == oldUser.birthDate) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No changes to update")),
        );
        return;
      }

      context.read<UserBloc>().add(UpdateUser(updatedUser));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final user = state.user;

        if (state.loading!) {
          return const Center(child: CircularProgressIndicator());
        }

        if (user == null) {
          return const Center(child: Text("No user data"));
        }

        fullNameController.text = user.fullName ?? "";
        emailController.text = user.email ?? "";
        phoneController.text = user.phoneNumber ?? "";
        genderController.text = user.gender ?? "";
        dateController.text = user.birthDate != null
            ? user.birthDate!.toIso8601String().split("T").first
            : "";

        return Scaffold(
          extendBody: true,
          backgroundColor: AppColors.white,
          appBar: CustomAppBarMain(title: "My Details"),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
              child: Column(
                children: [
                  Divider(
                    color: AppColors.primary100,
                  ),
                  CustomTextFormUser(
                    label: "Full Name",
                    controller: fullNameController,
                  ),
                  CustomTextFormUser(
                    label: "Email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  CustomTextFormUser(
                    label: "Phone",
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  CustomTextFormUser(
                    label: "Gender",
                    controller: genderController,
                    svgIcon: "assets/Chevron.svg",
                  ),
                  CustomTextFormUser(
                    label: "Birth Date",
                    controller: dateController,
                    svgIcon: "assets/Calendar.svg",
                    readOnly: true,
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: user.birthDate ?? DateTime(2000, 1, 1),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        dateController.text = picked
                            .toIso8601String()
                            .split("T")
                            .first;
                      }
                    },
                  ),
                  SizedBox(height: 94),

                  SizedBox(
                    width: double.infinity,
                    child: CustomTextButton(
                      title: 'Submit',
                      backgroundColor: AppColors.primary,
                      titleColor: AppColors.white,
                      onPressed: () => _onSubmit(user),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: CustomBottomNavigationBar(isActive: 4),
        );
      },
    );
  }
}
