import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/data/model/payment_model/add_cart_model.dart';
import 'package:store_app/features/common/widgets/custom_appbar_main.dart';
import 'package:store_app/features/common/widgets/custom_text_button.dart';
import '../../../core/utils/card_validator.dart';
import '../../../core/utils/input_formatter.dart';
import '../../common/widgets/custom_dialog.dart';
import '../managers/card_bloc.dart';
import '../managers/card_event.dart';
import '../widgets/custom_card_textfield.dart';

class NewCardPage extends StatefulWidget {
  const NewCardPage({super.key});

  @override
  State<NewCardPage> createState() => _NewCardPageState();
}

class _NewCardPageState extends State<NewCardPage> {
  final formKey = GlobalKey<FormState>();
  final numberController = TextEditingController();
  final dateController = TextEditingController();
  final codeController = TextEditingController();

  String convertExpiryDate(String input) {
    final parts = input.split('/');
    final month = parts[0];
    final year = parts[1];
    return "20$year-$month-01";
  }

  @override
  void dispose() {
    numberController.dispose();
    dateController.dispose();
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      appBar: CustomAppBarMain(
        title: "New Card",
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 31.h),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                "Add Debit or Credit Card",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontFamily: "GeneralSans",
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 16.h),

              CustomCardTextField(
                controller: numberController,
                label: 'Card number',
                hint: 'Enter your card number',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(19),
                  CardNumberInputFormatter(),
                ],
                validator: CardValidators.validateCardNumber,
              ),
              SizedBox(height: 16.h),

              Row(
                children: [
                  Expanded(
                    child: CustomCardTextField(
                      controller: dateController,
                      label: 'Expiry Date',
                      hint: "MM/YY",
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(5),
                        ExpiryDateInputFormatter(),
                      ],
                      validator: CardValidators.validateExpiryDate,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: CustomCardTextField(
                      controller: codeController,
                      label: 'Security Code',
                      hint: "CVC",
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                      validator: CardValidators.validateCVC,
                    ),
                  ),
                ],
              ),
              const Spacer(),

              CustomTextButton(
                titleColor: AppColors.white,
                backgroundColor: AppColors.primary,
                title: 'Add Card',
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) => CustomDialog(
                        title: 'Congratulations!',
                        message: 'Your new card has been added.',
                        buttonText: 'Thanks',
                        onPressed: () {
                          context.pop();
                          context.go(Routes.addCard);
                        },
                      ),
                    );
                    context.read<CardBloc>().add(
                      CardAddEvent(
                        AddCardModel(
                          cardNumber: numberController.text,
                          expiryDate: convertExpiryDate(dateController.text),
                          securityCode: codeController.text,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
