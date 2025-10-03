import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/features/address/managers/address_bloc.dart';
import 'package:store_app/features/address/managers/address_state.dart';
import 'package:store_app/features/common/widgets/custom_appbar_main.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      appBar: CustomAppBarMain(title: "Address"),
      body: BlocBuilder<AddressBloc, AddressState>(
        builder: (context, state) {
          if (state.loading == true) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null) {
            return Center(child: Text(state.errorMessage!));
          }

          final addresses = state.address ?? [];

          if (addresses.isEmpty) {
            return Center(child: Text("No saved cards"));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          );
        },
      ),
    );
  }
}
