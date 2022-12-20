import 'package:chat_app/auth/screen/login_screen.dart';
import 'package:chat_app/auth/screen/signup_screen.dart';
import 'package:chat_app/chat/screens/chat_contact_list.dart';
import 'package:chat_app/chat/screens/chat_screen.dart';
import 'package:chat_app/landing_screen/landing_screen.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:chat_app/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  RouteGenerator._();
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    Object? arguments = settings.arguments;
    switch (settings.name) {
      case Routes.loginScreenRoute:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.signUpScreenRoute:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (context) => const LandingScreen());
      case Routes.settingsScreenRoute:
        return MaterialPageRoute(builder: (context) => const SettingsScreen());
      case Routes.chatListScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const ChatContactListScreen());

      case Routes.chatScreenRoute:
        return MaterialPageRoute(
            builder: (context) => ChatScreen(
                  chatScreenArgModel: arguments as ChatScreenArgModel,
                ));
    }
    return null;
  }
}
