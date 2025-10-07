import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/features/common/widgets/custom_appbar_main.dart';
import 'package:store_app/features/common/widgets/custom_text_button.dart';
import 'package:store_app/features/address/managers/address_bloc.dart';
import 'package:store_app/features/address/managers/address_event.dart';
import 'package:store_app/features/address/managers/address_state.dart';
import '../widgets/custom_address_widget.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBody: true,
      appBar: const CustomAppBarMain(title: "Address"),
      body: BlocBuilder<AddressBloc, AddressState>(
        builder: (context, state) {
          if (state.loading == true) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null) {
            return Center(
              child: Text(
                state.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final addresses = state.address ?? [];

          if (addresses.isEmpty) {
            return const Center(child: Text("No saved address"));
          }

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 100.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Saved Address",
                    style: TextStyle(
                      fontFamily: "GeneralSans",
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 15.h),

                  Column(
                    children: List.generate(addresses.length, (index) {
                      final address = addresses[index];

                      return AddressWidget(
                        address: address,
                        selectedId: state.selectedAddressId,
                        onSelected: (id) {
                          context.read<AddressBloc>().add(
                            SelectAddressEvent(id),
                          );
                        },
                      );
                    }),
                  ),

                  SizedBox(height: 12.h),
                  CustomTextButton(
                    title: "Add New Address",
                    onPressed: (){
                      context.push(Routes.newAddress);
                    },
                    backgroundColor: Colors.transparent,
                    borderColor: AppColors.grey,
                    titleColor: AppColors.primary,
                    leftIcon: 'assets/Plus.svg',
                  ),
                ],
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: Container(
        width: double.infinity,
        height: 86.h,
        color: AppColors.white,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: CustomTextButton(
          title: 'Apply',
          backgroundColor: AppColors.primary,
          titleColor: AppColors.white,
          onPressed: () {
            final selectedId = context
                .read<AddressBloc>()
                .state
                .selectedAddressId;
            if (selectedId != null) {
              debugPrint('Applying address id: $selectedId');
            }
          },
        ),
      ),
    );
  }
}
