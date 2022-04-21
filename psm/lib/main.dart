import 'package:flutter/material.dart';
import 'package:psm/widgets/custom_bottomappbar.dart';
import 'widgets/custom_appbar.dart';

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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Haseena',
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
