// home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/data/repository/category_repository.dart';
import 'package:store_app/data/repository/product_repository.dart';
import 'package:store_app/features/home/managers/category_cubit.dart';
import 'package:store_app/features/home/managers/category_state.dart';
import 'package:store_app/features/home/managers/product_cubit.dart';
import 'package:store_app/features/home/managers/product_state.dart';
import 'package:store_app/features/home/widgets/category_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryCubit(
            categoryRepo: context.read<CategoryRepository>(),
          )..fetchCategories(),
        ),
        BlocProvider(
          create: (context) => ProductCubit(
            productRepo: context.read<ProductRepository>(),
          ),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            "Discover",
            style: TextStyle(
              color: AppColors.primary,
              fontFamily: "GeneralSans",
              fontSize: 32.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: SvgPicture.asset('assets/Bell.svg'),
          )],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24, top: 15),
          child: Column(
            children: [
              SizedBox(
                height: 36.h,
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state.isLoading) return const Center(child: CircularProgressIndicator());
                    if (state.errorMessage != null) return Center(child: Text("Xato: ${state.errorMessage}"));
                    if (state.categories.isEmpty) return const Center(child: Text("Kategoriya yo‘q"));

                    return BlocBuilder<ProductCubit, ProductState>(
                      builder: (context, productState) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) {
                            final category = state.categories[index];
                            final isSelected = productState.categoryId == category.id;

                            return CategoryItem(
                              category: category,
                              isSelected: isSelected,
                              onTap: () {
                                context.read<ProductCubit>().fetchProduct(category.id);
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),

              Expanded(
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.errorMessage != null) {
                      return Center(child: Text("Xato: ${state.errorMessage}"));
                    }
                    if (state.products.isEmpty) {
                      return const Center(child: Text("Product yo‘q"));
                    }

                    return ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return ListTile(
                          title: Text(product.title),
                          subtitle: Text("\$${product.price}"),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
