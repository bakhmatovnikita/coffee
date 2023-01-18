import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/presentation/auth/choice_adress/view/choice_adress.dart';
import 'package:cofee/features/presentation/auth/code_view/view/code_view.dart';
import 'package:cofee/features/presentation/auth/hello_view/hello_view.dart';
import 'package:cofee/features/presentation/auth/login_view/view/login_view.dart';
import 'package:cofee/features/presentation/auth/root_screen/view/root_screen.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/map/view/map.dart';
import 'package:cofee/features/presentation/home/widgets/bottom_nav_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generatenRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const RootScreen());
      case "/MainView":
        final arguments = settings.arguments as Map<String, dynamic>;
        if (arguments['organizationId'] is String) {
          return MaterialPageRoute(
            builder: (context) => BottomNavView(
              organizationId: arguments['organizationId'],
            ),
          );
        } else {
          return _errorRoute();
        }
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
        if (arguments['phone'] is String?) {
          return MaterialPageRoute(
            builder: (context) => ChoiceAdressView(
              phone: arguments['phone'],
            ),
          );
        } else {
          return _errorRoute();
        }
      case "/MapView":
        final argument = settings.arguments as Map<String, dynamic>;
        if (argument['cartModel'] is List<CartModel> &&
            argument["totalAmount"] is double &&
            argument['totalWeigth'] is double) {
          return MaterialPageRoute(
            builder: (context) => MapPage(
              cartModel: argument['cartModel'],
              totalAmount: argument["totalAmount"],
              totalWeigth: argument['totalWeigth'],
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
