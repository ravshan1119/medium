import 'package:flutter/material.dart';
import 'package:medium/data/models/user/user_model.dart';
import 'package:medium/presentation/auth/auth_screen.dart';
import 'package:medium/presentation/auth/gmail_confirm/gmail_confirm_screen.dart';
import 'package:medium/presentation/auth/login/login_screen.dart';
import 'package:medium/presentation/auth/signup/signup_screen.dart';
import 'package:medium/presentation/splash/splash_screen.dart';
import 'package:medium/presentation/tab/tab_box.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String authScreen = "/auth_screen";
  static const String tabBox = "/tab_box";
  static const String confirmGmail = "/confirm_gmail";
  static const String signupScreen = "/signup_screen";
  static const String loginScreen = "/login_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RouteNames.authScreen:
        return MaterialPageRoute(builder: (context) {
          return AuthScreen();
        });

      case RouteNames.tabBox:
        return MaterialPageRoute(builder: (context) => TabBox());

      case RouteNames.confirmGmail:
        return MaterialPageRoute(builder: (context) => GmailConfirmScreen(userModel: settings.arguments as UserModel,));
        case RouteNames.signupScreen:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
        case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (context) => LogInScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route mavjud emas"),
            ),
          ),
        );
    }
  }
}
