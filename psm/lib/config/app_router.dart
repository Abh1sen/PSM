import 'package:flutter/material.dart';
import 'package:psm/models/catagory_model.dart';
import 'package:psm/models/models.dart';
import 'package:psm/screens/login/after_login_screen.dart';
import 'package:psm/screens/registration/registration_screen.dart';
import 'package:psm/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This route is: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case RegistrationScreen.routeName:
        return RegistrationScreen.route();
      case AfterLoginScreen.routeName:
        return AfterLoginScreen.route();
      case OrderConfirmationScreen.routeName:
        return OrderConfirmationScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Error'),
        ),
      ),
    );
  }
}
