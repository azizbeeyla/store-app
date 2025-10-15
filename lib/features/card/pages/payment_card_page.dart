import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/features/common/widgets/custom_appbar_main.dart';
import 'package:store_app/features/common/widgets/custom_text_button.dart';
import '../managers/card_bloc.dart';
import '../managers/card_event.dart';
import '../managers/card_state.dart';

class PaymentCardPage extends StatelessWidget {
  const PaymentCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardBloc, CardState>(
      builder: (context, state) {
        final cards = state.card ?? [];

        return Scaffold(
          backgroundColor: AppColors.white,
          extendBody: true,
          appBar: const CustomAppBarMain(title: "Payment Method"),

          // ✅ Body holatga qarab
          body: () {
            if (state.loading == true) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.errorMessage != null) {
              return Center(child: Text(state.errorMessage!));
            }

            if (cards.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      "No saved cards yet",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                        fontFamily: "GeneralSans",
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Add a payment method to continue checkout.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              );
            }

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 100.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Saved Cards",
                      style: TextStyle(
                        fontFamily: "GeneralSans",
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 15.h),

                    Column(
                      children: List.generate(cards.length, (index) {
                        final card = cards[index];
                        final last4 = card.cardNumber.length >= 4
                            ? card.cardNumber.substring(card.cardNumber.length - 4)
                            : card.cardNumber ?? '';

                        return Container(
                          margin: EdgeInsets.only(bottom: 12.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 14.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.credit_card,
                                  size: 32.sp, color: AppColors.primary),
                              SizedBox(width: 12.w),

                              Expanded(
                                child: Text(
                                  "**** **** **** $last4",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),

                              if (card.isDefault == true)
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Text(
                                    "Default",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),

                              SizedBox(width: 8.w),

                              Radio<int>(
                                activeColor: AppColors.primary,
                                value: card.id,
                                groupValue: state.selectedCardId,
                                onChanged: (val) {
                                  if (val != null) {
                                    context
                                        .read<CardBloc>()
                                        .add(SelectCardEvent(val));
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 12.h,),
                    CustomTextButton(
                      title: "Add New Card",
                      backgroundColor: Colors.transparent,
                      borderColor: AppColors.grey,
                      titleColor: AppColors.primary,
                      leftIcon: 'assets/Plus.svg',
                      onPressed: () => context.push(Routes.addCard),
                    ),

                  ],
                ),
              ),
            );
          }(),

          bottomNavigationBar: Container(
            width: double.infinity,
            height: 86.h,
            color: AppColors.white,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: CustomTextButton(
              title: cards.isEmpty ? "Add New Card" : "Apply",
              backgroundColor:cards.isEmpty?AppColors.white: AppColors.primary,
              titleColor:cards.isEmpty?AppColors.primary: AppColors.white,
              borderColor: cards.isEmpty?AppColors.primary200:null,
              leftIcon: 'assets/Plus.svg',
              onPressed: () {
                if (cards.isEmpty) {
                  context.push(Routes.addCard);
                } else {
                  final selectedId = state.selectedCardId;
                  if (selectedId != null) {
                    debugPrint('Applying card id: $selectedId');
                    context.pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select a card"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
            ),
          ),
        );
      },
    );
  }
}
