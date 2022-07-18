import 'package:delivery_food/screen/onboarding.dart';
import 'package:delivery_food/screen/onborading2.dart';
import 'package:delivery_food/screen/fill_infor.dart';
import 'package:delivery_food/screen/splash_screen.dart';
import 'package:flutter/material.dart';

/// Route management class
class RouteGenerator  {
  const RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case splash:
        return MaterialPageRoute<SplashScreen>(
          builder: (_) => const SplashScreen(),
        );
      case onboard:
        return MaterialPageRoute<OnBoardingScreen>(
            builder: (_) => const OnBoardingScreen());
      case onboard2:
        return MaterialPageRoute<OnBoardingScreen2>(
            builder: (_) => const OnBoardingScreen2());
      case signupprocess:
        return MaterialPageRoute<FillInfor>(
            builder: (_) => const FillInfor());
      default:
        throw const RouteException("Route not found");
    }
  }

  static const splash = 'splash';
  static const signupprocess = 'SignupProcess';
  static const onboard = 'onboaring';
  static const onboard2 = 'onboaring2';
}

/// Exception thrown when a given route doesn't exist
class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}
