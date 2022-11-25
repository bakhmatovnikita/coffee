import 'package:cofee/features/auth/presentation/views/choice_adress/view/choice_adress.dart';
import 'package:cofee/features/auth/presentation/views/code_view/view/code_view.dart';
import 'package:cofee/features/auth/presentation/views/hello_view/hello_view.dart';
import 'package:cofee/features/auth/presentation/views/login_view/view/login_view.dart';
import 'package:cofee/features/home/presentation/views/bottom_nav_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generatenRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const BottomNavView());
      case "/LoginView":
        return MaterialPageRoute(builder: (context) => const LoginView());
      case "/HelloView":
        return MaterialPageRoute(builder: (context) => const HelloView());
      case "/CodeView":
        final arguments = settings.arguments as Map<String, dynamic>;
        if (arguments['phone'] is String) {
          return MaterialPageRoute(
            builder: (context) => CodeView(
              phone: arguments['phone'],
            ),
          );
        } else {
          return _errorRoute();
        }
      case "/ChoiceAdressView":
        final arguments = settings.arguments as Map<String, dynamic>;
        if (arguments['phone'] is String) {
          return MaterialPageRoute(
            builder: (context) => ChoiceAdressView(
              phone: arguments['phone'],
            ),
          );
        } else {
          return _errorRoute();
        }

      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return const Scaffold(
      body: Center(
        child: Text('Error!'),
      ),
    );
  });
}
