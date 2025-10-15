import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/features/common/widgets/custom_appbar_main.dart';
import 'package:store_app/features/common/widgets/custom_botttom_navigation.dart';
import 'package:store_app/features/common/widgets/custom_text_button.dart';
import 'package:store_app/features/common/widgets/empty_widget.dart';
import 'package:store_app/features/mycart/managers/my_cart_bloc.dart';
import 'package:store_app/features/mycart/managers/my_cart_state.dart';
import 'package:store_app/features/mycart/widgets/my_cart_item_widget.dart';
import 'package:store_app/features/mycart/widgets/total_item.dart';

import '../managers/my_cart_event.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBody: true,
      appBar: const CustomAppBarMain(title: "My Cart"),
      body: BlocProvider(
          create: (context) =>
          CartBloc(repository: context.read())..add(LoadCart()),
        child: BlocBuilder<CartBloc, MyCartState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.errorMessage != null) {
              return Center(child: Text(state.errorMessage!));
            }

            if (state.cart == null || state.cart!.items.isEmpty) {
              return EmptyStateWidget(
                assetPath: 'assets/Cart-duotone.svg',
                title: 'Your Cart Is Empty!',
                subtitle: 'When you add products, they’ll appear here.',
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 3.3,
                          ),
                      itemCount: state.cart!.items.length,
                      itemBuilder: (context, index) {
                        final item = state.cart!.items[index];
                        return MyCartItemWidget(item: item);
                      },
                    ),
                  ),

                  SafeArea(
                    top: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: TotalItem(item: state.cart!),
                        ),
                         SizedBox(height: 51),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: CustomTextButton(
                            title: 'Go To Checkout',
                            onPressed: (){
                              context.push(Routes.checkOut);
                            },
                            backgroundColor: AppColors.primary,
                            titleColor: AppColors.white,
                            rightIcon: 'assets/arrow-right.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),

      bottomNavigationBar: CustomBottomNavigationBar(isActive: 3),
    );
  }
}
