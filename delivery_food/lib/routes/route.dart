import 'package:delivery_food/authenticated/screens/chat_message.dart';
import 'package:delivery_food/authenticated/screens/home_screen.dart';
import 'package:delivery_food/data/model/user.dart';
import 'package:delivery_food/routes/chat_message_arg.dart';
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
    final args = settings.arguments;
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case onborading:
        return CustomPageRoute(
            child: const OnBoardingScreen(), settings: settings);
      case onborading2:
        return CustomPageRoute(
            child: const OnBoardingScreen2(), settings: settings);
      case signup:
        return CustomPageRoute(child: const SignUpScreen(), settings: settings);
      case signin:
        return CustomPageRoute(
            child: const LoginPage(),
            settings: settings,
            direction: AxisDirection.down);
      case home:
        User user = args as User;
        return CustomPageRoute(
            child: HomeScreen(
              users: user,
            ),
            settings: settings,
            direction: AxisDirection.down);
      case chat:
        ChatMessageArgument chatMessageArgument = args as ChatMessageArgument;
        return CustomPageRoute(
            child: ChatMessage(
              idChat: chatMessageArgument.idchat,
              ornerUser: chatMessageArgument.ornerUser,
              // listGroupMesgae: chatMessageArgument.listGroupMesgae,
            ),
            settings: settings,
            direction: AxisDirection.down);
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
  static const chat = 'chat';
}

/// Exception thrown when a given route doesn't exist
class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}
