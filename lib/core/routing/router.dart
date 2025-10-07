import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/account/pages/account_page.dart';
import 'package:store_app/features/account/pages/faqs_page.dart';
import 'package:store_app/features/account/pages/help_center_page.dart';
import 'package:store_app/features/address/pages/address_page.dart';
import 'package:store_app/features/address/pages/new_address_page.dart';
import 'package:store_app/features/authentication/managers/auth_view_model.dart';
import 'package:store_app/features/authentication/pages/forgot_password_page.dart';
import 'package:store_app/features/authentication/pages/reset_code_page.dart';
import 'package:store_app/features/authentication/pages/reset_password_page.dart';
import 'package:store_app/features/authentication/pages/sign_up_page.dart';
import 'package:store_app/features/card/pages/new_card_page.dart';
import 'package:store_app/features/card/pages/payment_card_page.dart';
import 'package:store_app/features/checkout/pages/checkout_page.dart';
import 'package:store_app/features/home/pages/home_page.dart';
import 'package:store_app/features/home/pages/search_page.dart';
import 'package:store_app/features/my_detail/pages/my_detail_page.dart';
import 'package:store_app/features/mycart/pages/my_cart_page.dart';
import 'package:store_app/features/notification/pages/notification_page.dart';
import 'package:store_app/features/notification/pages/notification_settings_page.dart';
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
            final productId = int.parse(state.pathParameters['id']!);

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

        GoRoute(
          path: Routes.savedPage,
          builder: (context, state) => SavedPage(),
        ),
      ],
    ),
    GoRoute(
      path: Routes.notification,
      builder: (context, state) => NotificationPage(),
    ),
    GoRoute(
      path: Routes.searchPage,
      name: Routes.searchPage,
      builder: (context, state) => SearchPage(),
      routes: [
        GoRoute(
          name: Routes.searchToDetail,
          path: Routes.searchToDetail,
          builder: (context, state) {
            final productId = int.parse(state.extra as String);

            return ProductDetailPage(productId: productId);
          },
        ),
      ],
    ),
    GoRoute(path: Routes.myCartPage,builder: (context, state) => MyCartPage(),),
    GoRoute(path: Routes.paymentCard,builder: (context, state) => PaymentCardPage(),),
    GoRoute(path: Routes.addCard,builder: (context, state) => NewCardPage(),),
    GoRoute(path: Routes.accountPage,builder: (context, state) => AccountPage(),),
    GoRoute(path: Routes.notifSettings,builder: (context, state) => NotificationSettingsPage(),),
    GoRoute(path: Routes.address,builder: (context, state) => AddressPage(),),
    GoRoute(path: Routes.helpCenter,builder: (context, state) => HelpCenterPage(),),
    GoRoute(path: Routes.myDetail,builder: (context, state) => MyDetailPage(),),
    GoRoute(path: Routes.checkOut,builder: (context, state) => CheckoutPage(),),
    GoRoute(path: Routes.faqPage,builder: (context, state) => FaqPage(),),
    GoRoute(path: Routes.newAddress,builder: (context, state) => NewAddressPage(),),

  ],
);
