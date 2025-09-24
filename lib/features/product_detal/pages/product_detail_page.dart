import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_color.dart';
import '../../common/widgets/custom_appbar_main.dart';
import '../managers/detail_cubit.dart';
import '../managers/detail_state.dart';
import '../widgets/detail_bottom_bar.dart';
import '../widgets/detail_image_widget.dart';
import '../widgets/detail_info_widget.dart';
import '../widgets/detail_size_widget.dart';
import '../widgets/review_detail_widget.dart';

class ProductDetailPage extends StatelessWidget {
  final int productId;
  const ProductDetailPage({required this.productId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DetailCubit(
        reviewRepository: context.read(),
        productRepo: context.read(),
      )..fetchProductDetail(productId),
      child: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          if (state.loading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
            return Scaffold(
              appBar: CustomAppBarMain(title: "Details"),
              body: Center(
                child: Text(
                  state.errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final detail = state.detail;

          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: CustomAppBarMain(title: "Details"),
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 16),
                    children: [
                      DetailImageWidget(detail: detail),
                      SizedBox(height: 12.h),
                      DetailInfoWidget(detail: detail),
                      SizedBox(height: 16.h),
                      DetailSizesWidget(sizes: detail.productSizes),
                      SizedBox(height: 16.h),

                    ],
                  ),
                ),
                DetailBottomBar(price: detail.price),
              ],
            ),
          );
        },
      ),
    );
  }
}
