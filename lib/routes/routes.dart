import 'package:flutter/material.dart';
import 'package:lead_your_way/auth/screens/login.dart';
import 'package:lead_your_way/auth/screens/signup.dart';
import 'package:lead_your_way/onboarding/screens/onboarding_screen.dart';
import 'package:lead_your_way/shared/widgets/lyw_navigator.dart';

class RouteManager {
  static const String onboarding = '/';
  static const String loginpage = '/login';
  static const String signuppage = '/signup';
  static const String homepage = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case loginpage:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
      case signuppage:
        return MaterialPageRoute(
          builder: (context) => const SignUp(),
        );
      case homepage:
        return MaterialPageRoute(
          builder: (context) => const LywNavigator(),
        );
      default:
        throw const FormatException('Route not found! Check routes again!');
    }
  }
}
