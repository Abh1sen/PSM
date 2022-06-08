import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm/blocs/checkout/checkout_bloc.dart';
import 'package:psm/models/catagory_model.dart';
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

    return Scaffold(
      appBar: CustomAppBar(title: 'Login'),
      bottomNavigationBar: CustomBottomAppBar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Insert Haseena Heart Logo Here',
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 30,),
            //todo Please create the blocs for the login as currently still in checkout bloc
            _buildTextFormField((value) {
              context.read<CheckoutBloc>().add(UpdateCheckout(email: value));
            }, context, 'Email'),
            _buildTextFormField((value) {
              context.read<CheckoutBloc>().add(UpdateCheckout(email: value));
            }, context, 'Password'),
          ],
        ),
      ),
    );
  }

  Padding _buildTextFormField(
      Function(String)? onChanged, BuildContext context, String labelText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
              width: 75,
              child: Text(
                labelText,
                style: Theme.of(context).textTheme.bodyText1,
              )),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.only(left: 10),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          )
        ],
      ),
    );
  }
}
