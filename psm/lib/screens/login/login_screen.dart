import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm/blocs/checkout/checkout_bloc.dart';
import 'package:psm/models/catagory_model.dart';
import 'package:psm/screens/screens.dart';
import 'package:psm/widgets/widgets.dart';

import '../../models/models.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_bottomappbar.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final bool isLogin = true;
    final snackBar = SnackBar(content: Text('Login Successful!'));

    return Scaffold(
      appBar: CustomAppBar(title: 'Login'),
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
                  false, emailController),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: reusableTextField(
                  "Enter Password", Icons.lock, true, passwordController),
            ),
            SizedBox(
              height: 30,
            ),
            firebaseUIButton(context, isLogin, () {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text)
                  .then((value) {
                print("Login is Successful");
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AfterLoginScreen()));
              }).onError((error, stackTrace) {
                print("Error ${error.toString()}");
              });
            }),
            SizedBox(
              height: 30,
            ),
            signUpOption(context),
          ],
        ),
      ),
    );
  }

  Row signUpOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
            style: TextStyle(color: Colors.black, fontSize: 14)),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/registration');
          },
          child: const Text(
            " Register Now",
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        )
      ],
    );
  }

}
