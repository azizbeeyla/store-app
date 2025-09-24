import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/authentication/managers/auth_view_model.dart';
import 'package:store_app/features/authentication/pages/forgot_password_page.dart';
import 'package:store_app/features/authentication/pages/reset_code_page.dart';
import 'package:store_app/features/authentication/pages/reset_password_page.dart';
import 'package:store_app/features/authentication/pages/sign_up_page.dart';
import 'package:store_app/features/home/pages/home_page.dart';
import 'package:store_app/features/notification/pages/notification_page.dart';
import 'package:store_app/features/onboarding/pages/on_boarding_page.dart';
import 'package:store_app/features/onboarding/pages/splash_page.dart';
import 'package:store_app/features/saved/pages/saved_page.dart';

import '../../features/authentication/pages/login_page.dart';
import '../../features/product_detal/pages/product_detail_page.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnBoardingPage(),
    ),
    GoRoute(
      path: Routes.signup,
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => LoginPage(),
    ),

    ShellRoute(
      builder: (context, state, child) => ChangeNotifierProvider(
        create: (context) => AuthViewModel(resetRepo: context.read()),
        child: child,
      ),

      routes: [
        GoRoute(
          path: '${Routes.detail}/:id',
          builder: (context, state) {
            final productId = int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;
            return ProductDetailPage(productId: productId);
          },
        ),

        GoRoute(
          path: Routes.forgotPassword,
          builder: (context, state) => ForgotPasswordPage(),
        ),
        GoRoute(
          path: Routes.resetCode,
          builder: (context, state) => ResetCodePage(),
        ),
        GoRoute(
          path: Routes.resetPassword,
          builder: (context, state) => ResetPasswordPage(),
        ),
        GoRoute(
          path: Routes.homePage,
          builder: (context, state) => HomePage(),
        ),
        
        GoRoute(path: Routes.savedPage,builder: (context, state) => SavedPage(),)
      ],
    ),
    GoRoute(path: Routes.notification,builder: (context, state) => NotificationPage(),)
  ],
);
