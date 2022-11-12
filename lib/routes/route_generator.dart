import 'package:chat_app/auth/screen/login_screen.dart';
import 'package:chat_app/auth/screen/signup_screen.dart';
import 'package:chat_app/home/home_screen.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  RouteGenerator._();
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    Object? arguments = settings.arguments;
    switch (settings.name) {
      case Routes.signUpScreenRoute:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => LoginScreen());
    }
  }
}
