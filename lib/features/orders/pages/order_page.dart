import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/features/common/widgets/custom_appbar_main.dart';
import 'package:store_app/features/common/widgets/custom_botttom_navigation.dart';
import 'package:store_app/features/common/widgets/empty_widget.dart';
import 'package:store_app/features/orders/managers/order_bloc.dart';
import 'package:store_app/features/orders/managers/order_event.dart';
import 'package:store_app/features/orders/managers/order_state.dart';
import 'package:store_app/features/orders/widgets/order_item.dart';
import 'package:store_app/features/orders/widgets/selectable_container.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final status = ['Ongoing', 'Completed'];

  @override
  void initState() {
    super.initState();
    context.read<OrderBloc>().add(GetOrderEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: AppColors.white,
        appBar: const CustomAppBarMain(title: 'My Orders'),
        body: BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              if (state.isOrderLoad ?? false) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.orderError != null) {
                return Center(child: Text(state.orderError!));
              }

              final filtered = state.selectedIndex == 1
                  ? (state.orders ?? [])
                  .where((e) => e.status == "Completed")
                  .toList()
                  : (state.orders ?? [])
                  .where((e) => e.status != "Completed")
                  .toList();

              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SizedBox(height: 10.h),

              SizedBox(
                height: 54.h,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    decoration: BoxDecoration(color: AppColors.primary100,borderRadius: BorderRadius.circular(10.r)),
                    child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: status.length,
                    separatorBuilder: (context, _) => SizedBox(width: 8.w),
                    itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SelectableContainer(
                      title: status[index],
                      isSelected: state.selectedIndex == index,
                      onTap: () {
                      context
                          .read<OrderBloc>()
                          .add(ChangeStatusEvent(index));
                      },
                      ),
                    );
                    },
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.h),


                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: filtered.isEmpty
                            ? Center(
                          child: EmptyStateWidget(
                            assetPath: state.selectedIndex == 1
                                ? 'assets/Box-duotone.svg'
                                : 'assets/Box-duotone.svg',
                            title: state.selectedIndex == 1
                                ? 'No Completed Orders'
                                : 'No Ongoing Orders',
                            subtitle: state.selectedIndex == 1
                                ? 'You haven’t completed any orders yet.'
                                : 'You don’t have any ongoing orders.',
                          ),
                        )
                            : GridView.builder(
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 3.3,
                          ),
                          itemCount: filtered.length,
                          itemBuilder: (context, index) {
                            final order = filtered[index];
                            return OrderItem(orders: order);
                          },
                        ),
                      ),
                    ),
                  ],
              );
            },
        ),
      bottomNavigationBar: CustomBottomNavigationBar(isActive: 4),
    );
  }
}
