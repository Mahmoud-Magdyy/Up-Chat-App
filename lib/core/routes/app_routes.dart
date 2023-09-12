import 'package:flutter/material.dart';
import 'package:up_chat_app/feature/auth/presentation/screens/auth/forget_password_screen.dart';
import 'package:up_chat_app/feature/auth/presentation/screens/auth/login_screen.dart';
import 'package:up_chat_app/feature/auth/presentation/screens/auth/register_screen.dart';
import 'package:up_chat_app/feature/auth/presentation/screens/on_boarding_screens/on_boarding_screens.dart';
import 'package:up_chat_app/feature/auth/presentation/screens/splash_screen/splash_screen.dart';

class Routes {
  static const String intitlRoute = '/';
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String forgetPassword = '/forgetPassword';
 
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) =>  OnBoaringScreens());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

    
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('No Found Route'),
                  ),
                ));
    }
  }
}
