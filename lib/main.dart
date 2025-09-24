import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:store_app/data/repository/category_repository.dart';
import 'package:store_app/data/repository/notification_repository.dart';
import 'package:store_app/data/repository/product_detail_repository.dart';
import 'package:store_app/data/repository/product_repository.dart';
import 'package:store_app/data/repository/reset_repository.dart';
import 'package:store_app/data/repository/review_repository.dart';

import 'core/client/dio_client.dart';
import 'core/interceptor.dart';
import 'core/routing/router.dart';
import 'data/repository/auth_repository.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            Provider<FlutterSecureStorage>(
              create: (_) => const FlutterSecureStorage(),
            ),

            Provider<AuthInterceptor>(
              create: (context) => AuthInterceptor(
                secureStorage: context.read<FlutterSecureStorage>(),
              ),
            ),

            Provider<ApiClient>(
              create: (context) =>
                  ApiClient(interceptor: context.read<AuthInterceptor>()),
            ),

            Provider<AuthRepository>(
              create: (context) => AuthRepository(
                apiClient: context.read<ApiClient>(),
              ),
            ),
            Provider(
              create: (context) => ResetRepository(apiClient: context.read()),
            ),
            Provider(
              create: (context) => ProductRepository(apiClient: context.read()),
            ),
            Provider(
              create: (context) =>
                  CategoryRepository(apiClient: context.read()),
            ),
            Provider(
              create: (context) =>
                  NotificationRepository(apiClient: context.read()),
            ),
            Provider(create: (context) => ReviewRepository(apiClient: context.read()),),
            
            Provider(create: (context) => DetailRepository(apiClient: context.read()),)
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          ),
        );
      },
    );
  }
}
