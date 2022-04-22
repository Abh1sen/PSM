import 'package:flutter/material.dart';
import 'package:psm/screens/home/home_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This route is: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
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
