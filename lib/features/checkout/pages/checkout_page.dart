import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/features/checkout/widgets/address_widget.dart';
import 'package:store_app/features/checkout/widgets/payment_widget.dart';
import 'package:store_app/features/common/widgets/custom_appbar_main.dart';
import 'package:store_app/features/common/widgets/custom_text_button.dart';
import 'package:store_app/features/mycart/managers/my_cart_state.dart';
import 'package:store_app/features/mycart/widgets/total_item.dart';
import 'package:store_app/features/checkout/widgets/promocode_widget.dart';
import 'package:store_app/features/orders/managers/order_event.dart';
import '../../address/managers/address_bloc.dart';
import '../../card/managers/card_bloc.dart';
import '../../mycart/managers/my_cart_bloc.dart';
import '../../orders/managers/order_bloc.dart';
import '../../orders/managers/order_state.dart';
class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});
  @override
  Widget build(BuildContext context) {
    final addressState = context.watch<AddressBloc>().state;
    final cardState = context.watch<CardBloc>().state;
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
      if (state.createSuccess!) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("✅ Order placed successfully!"),
              backgroundColor: Colors.green,
            ),
          );
          context.go(Routes.homePage);
        } else if (state.createError != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.createError!),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, orderState) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: CustomAppBarMain(title: "Checkout"),
          body: BlocBuilder<CartBloc, MyCartState>(
            builder: (context, cartState) {
              if (cartState.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (cartState.errorMessage != null) {
                return Center(child: Text(cartState.errorMessage!));
              }

              final selectedAddress =
                  (addressState.address?.isNotEmpty ?? false)
                  ? addressState.address!.firstWhere(
                      (a) => a.id == addressState.selectedAddressId,
                      orElse: () => addressState.address!.first,
                    )
                  : null;

              final selectedCard = (cardState.card?.isNotEmpty ?? false)
                  ? cardState.card!.firstWhere(
                      (c) => c.id == cardState.selectedCardId,
                      orElse: () => cardState.card!.first,
                    )
                  : null;

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Delivery Address",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: AppColors.primary,
                            fontFamily: "GeneralSans",
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.push(Routes.address);
                          },
                          child: Text(
                            "Change",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.primary,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    if (selectedAddress != null)
                      Container(
                        padding: EdgeInsets.all(5.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.white),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: AddressWidget(selectedAddress: selectedAddress),
                      ),
                    Divider(color: AppColors.primary200),
                    SizedBox(height: 20.h),

                    Text(
                      "Payment Method",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.primary,
                        fontFamily: "GeneralSans",
                      ),
                    ),
                    SizedBox(height: 8.h),
                    if (selectedCard != null)
                      PaymentWidget(selectedCard: selectedCard),
                    SizedBox(height: 20.h),

                    Text(
                      "Order Summary",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.primary,
                        fontFamily: "GeneralSans",
                      ),
                    ),
                    SizedBox(height: 12.h),
                    TotalItem(item: cartState.cart!),
                    SizedBox(height: 40.h),
                    PromoCodeWidget(),
                    SizedBox(height: 90.h),

                    CustomTextButton(
                      title: orderState.isCreateLoad! ? "Placing..." : "Place Order",
                      backgroundColor: AppColors.primary,
                      titleColor: AppColors.white,
                      onPressed: orderState.isCreateLoad!
                          ? null
                          : () {
                              final addressId =
                                  addressState.selectedAddressId ;
                              final cardId = cardState.selectedCardId ;

                              context.read<OrderBloc>().add(
                                PlaceOrderEvent(
                                  addressId: addressId!,
                                  cardId: cardId!,
                                  paymentMethod: "Card",
                                ),
                              );
                            },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
