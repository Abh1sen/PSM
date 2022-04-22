import 'package:flutter/material.dart';
import 'package:psm/config/app_router.dart';
import 'package:psm/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haseena',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}
