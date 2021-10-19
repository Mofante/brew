import 'package:brew/src/screens/brewing.dart';
import 'package:brew/src/screens/home.dart';
import 'package:brew/src/screens/log_in_page.dart';
import 'package:brew/src/screens/sign_up_page.dart';
import 'package:brew/src/screens/success.dart';
import 'package:brew/src/screens/welcome_screen.dart';
import 'package:brew/src/screens/wrapper.dart';
import 'package:brew/src/templates.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Wrapper());
      case '/success':
        return MaterialPageRoute(builder: (_) => const Success());
      case '/register':
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/brew':
        if (args is BrewMethod) {
          return MaterialPageRoute(
            builder: (_) => BrewScreen(brewMethod: args),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(child: Text('ERROR')),
      );
    });
  }
}
