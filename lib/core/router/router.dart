import 'package:go_router/go_router.dart';
import 'package:store_app/core/router/routes.dart';
import 'package:store_app/features/authentication/pages/sign_up_page.dart';
import 'package:store_app/features/onboarding/pages/on_boarding_page.dart';
import 'package:store_app/features/onboarding/pages/splash_page.dart';

 final router=GoRouter(

     initialLocation: Routes.splash,
     routes: [
GoRoute(path: Routes.splash,builder: (context, state) => SplashPage(),),
GoRoute(path: Routes.onboarding,builder: (context, state) => OnBoardingPage(),),
GoRoute(path: Routes.signup,builder: (context, state) => SignUpPage(),),

]);