import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:store_app/data/repository/address_repository.dart';
import 'package:store_app/data/repository/card_repository.dart';
import 'package:store_app/data/repository/cart_repository.dart';
import 'package:store_app/data/repository/category_repository.dart';
import 'package:store_app/data/repository/notification_repository.dart';
import 'package:store_app/data/repository/notification_settings_repository.dart';
import 'package:store_app/data/repository/product_detail_repository.dart';
import 'package:store_app/data/repository/product_repository.dart';
import 'package:store_app/data/repository/reset_repository.dart';
import 'package:store_app/data/repository/review_repository.dart';
import 'package:store_app/features/address/managers/address_bloc.dart';
import 'package:store_app/features/home/managers/product_bloc.dart';
import 'package:store_app/features/home/managers/product_event.dart';
import 'package:store_app/firebase_options.dart';
import 'core/client/dio_client.dart';
import 'core/interceptor.dart';
import 'core/routing/router.dart';
import 'data/repository/auth_repository.dart';
import 'features/card/managers/card_bloc.dart';
import 'features/home/managers/category_cubit.dart';
import 'features/mycart/managers/my_cart_bloc.dart';
import 'features/mycart/managers/my_cart_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>('recent_search');

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final token = await FirebaseMessaging.instance.getToken();
  print("FCM TOKEN: $token");

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
            Provider(
              create: (context) => ReviewRepository(apiClient: context.read()),
            ),
            Provider(
              create: (context) => DetailRepository(apiClient: context.read()),
            ),
            Provider(
              create: (context) => CartRepository(apiClient: context.read()),
            ),
            Provider(
              create: (context) => CardRepository(apiClient: context.read()),
            ),
            Provider(
              create: (context) => NotificationSettingsRepository(),
              
            ),
            Provider(create: (context) => AddressRepository(apiClient: context.read()),)
          ],
          child: Builder(
            builder: (context) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => ProductBloc(
                      productRepo: context.read<ProductRepository>(),
                    )..add(FetchAllProducts()),
                  ),
                  BlocProvider(
                    create: (_) => CategoryCubit(
                      categoryRepo: context.read<CategoryRepository>(),
                    )..fetchCategories(),
                  ),
                  BlocProvider(
                    create: (context) =>
                        CartBloc(repository: context.read())..add(LoadCart()),
                  ),
                  BlocProvider(
                    create: (_) => CardBloc(repo: context.read()),
                  ),
                  BlocProvider(
                    create: (context) =>
                        AddressBloc(addressRepo: context.read()),
                  ),
                ],
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routerConfig: router,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
