import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class AfterLoginScreen extends StatefulWidget {
  const AfterLoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/logout';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => AfterLoginScreen(),
    );
  }

  @override
  _AfterLoginScreenState createState() => _AfterLoginScreenState();
}

class _AfterLoginScreenState extends State<AfterLoginScreen> {

  final snackBar = SnackBar(content: Text('Logout Successful!'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Welcome'),
      bottomNavigationBar: CustomBottomAppBar(screen: '/'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                child: Text(
                  "Logout",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    print("Signed Out");
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pushNamed(context, '/login');
                  });
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.red;
                      }
                      return Colors.black;
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
