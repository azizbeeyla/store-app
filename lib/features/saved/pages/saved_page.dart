import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/features/common/widgets/custom_appbar_main.dart';
import 'package:store_app/features/common/widgets/custom_botttom_navigation.dart';
import 'package:store_app/features/saved/managers/saved_cubit.dart';
import 'package:store_app/features/saved/managers/saved_state.dart';
import 'package:store_app/features/home/widgets/product_item.dart';
import 'package:store_app/features/saved/widgets/no_saved_widgets.dart';
import '../../../data/model/product_model.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SavedCubit(
        savedProductRepo:context.read()
      ),
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.white,
        appBar: CustomAppBarMain(title: "Saved Products"),
        body: BlocBuilder<SavedCubit, SavedState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.errorMessage != null) {
              return Center(child: Text("Xato: ${state.errorMessage}"));
            }

            if (state.savedProduct.isEmpty) {
              return const Center(child: NoSavedWidgets());
            }

            return GridView.builder(
              padding:  EdgeInsets.only(left: 24,right: 24,top: 30),
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 19,
                mainAxisSpacing: 20,
                childAspectRatio: 161/174 ,
              ),
              itemCount: state.savedProduct.length,
              itemBuilder: (context, index) {
                final ProductModel product = state.savedProduct[index];
                return ProductItem(
                  id: product.id,
                  width: 161,
                  height: 174,
                  imageHeight: 122,
                  image: product.image,
                  title: product.title,
                  price: product.price,
                  discount: product.discount,
                  isLiked: true,
                  onUnSave: () {
                    context.read<SavedCubit>().removeFromSaved(product.id);
                  },
                );
              },
            );
          },
        ),
        bottomNavigationBar: CustomBottomNavigationBar(isActive: 2),
      ),
    );
  }
}

