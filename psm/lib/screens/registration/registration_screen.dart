import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm/blocs/checkout/checkout_bloc.dart';
import 'package:psm/models/catagory_model.dart';
import 'package:psm/screens/home/home_screen.dart';
import 'package:psm/widgets/widgets.dart';

import '../../models/models.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_bottomappbar.dart';
import '../screens.dart';

class RegistrationScreen extends StatelessWidget {
  static const String routeName = '/registration';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => RegistrationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();
    final bool isRegistration = false;
    final snackBar = SnackBar(content: Text('Account Created!'));

    return Scaffold(
      appBar: CustomAppBar(title: 'Registration'),
      bottomNavigationBar: CustomBottomAppBar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: reusableTextField("Enter UserName", Icons.person_outline,
                  false, usernameController),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: reusableTextField(
                  "Enter Email", Icons.mail_outline, false, emailController),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: reusableTextField(
                  "Enter Password", Icons.lock, true, passwordController),
            ),
            SizedBox(
              height: 30,
            ),
            firebaseUIButton(context, isRegistration, () {
              FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text)
                  .then((value) {
                print("Created New Account");
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AfterLoginScreen()));
              }).onError((error, stackTrace) {
                print("Error ${error.toString()}");
              });
            }),
          ],
        ),
      ),
    );
  }
}
