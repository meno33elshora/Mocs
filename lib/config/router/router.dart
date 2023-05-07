import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mocs/presentation/pages/details_screen.dart';
import 'package:mocs/presentation/pages/layout/layout.dart';
import 'package:mocs/presentation/pages/login.dart';
import 'package:mocs/presentation/pages/on_borading.dart';
import 'package:mocs/presentation/pages/splash.dart';

import '../../di/injection.dart';
import '../../presentation/pages/setting_screen/fqs_screen.dart';
import '../../presentation/pages/setting_screen/notifications_screen.dart';
import '../../presentation/pages/setting_screen/terms_about_screen.dart';
import '../../presentation/pages/sign_up.dart';

class Routes {
  static const String splashRoute = "/";
  static const String language = "language";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String onBoarding = "/onBoarding";
  static const String layout = "/main";
  static const String details = "/details";
  static const String fqs = "/fqs";
  static const String notifications = "/notifications";
  static const String term = "/term";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const Splash());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const Login());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case Routes.layout:
        return MaterialPageRoute(builder: (_) => const Layout());
      case Routes.details:
        return MaterialPageRoute(
            builder: (_) => DetailsScreen(productModel: getIt() ,  check: getIt(), function: () { getIt(); },));
      case Routes.fqs:
        return MaterialPageRoute(
            builder: (_) => FrequencyScreen(fqaModel: getIt()));
      case Routes.notifications:
        return MaterialPageRoute(
            builder: (_) => NotificationScreen(notificationModel: getIt()));
      case Routes.term:
        return MaterialPageRoute(
            builder: (_) => TermsAndAboutScreen(termsAndAbout: getIt()));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('No Route Found'),
              ),
              body: const Center(
                child: Text('No Route Found'),
              ),
            ));
  }
}
