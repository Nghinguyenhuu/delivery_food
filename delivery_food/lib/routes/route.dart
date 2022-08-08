

import 'package:delivery_food/authenticated/screens/home_screen.dart';
import 'package:delivery_food/routes/fade_route.dart';
import 'package:delivery_food/unauthenticated/onboarding/onboarding.dart';
import 'package:delivery_food/unauthenticated/onboarding/onboarding2.dart';
import 'package:delivery_food/unauthenticated/onboarding/splash_screen.dart';
import 'package:delivery_food/unauthenticated/sign_in/login_page.dart';
import 'package:delivery_food/unauthenticated/sign_up/signup_screen.dart';
import 'package:flutter/material.dart';

/// Route management class
class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context)=> const SplashScreen());
      case onborading:
      return CustomPageRoute(child: const OnBoardingScreen(),settings: settings);
      case onborading2:
      return CustomPageRoute(child: const OnBoardingScreen2(),settings: settings);  
      case signup:
      return CustomPageRoute(child: const SignUpScreen(),settings: settings);
      case signin:
      return CustomPageRoute(child: const LoginPage(),settings: settings,direction: AxisDirection.down);
      case home:
      return CustomPageRoute(child: const HomeScreen(),settings: settings,direction: AxisDirection.down);
      default:
        throw const RouteException("Route not found");
    }
  }

  static const home = '/';
  static const splash = 'splash';
  static const onborading = 'onborading';
  static const onborading2 = 'onborading2';
  static const signup = 'signup';
  static const signin = 'signin';
}

/// Exception thrown when a given route doesn't exist
class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}
