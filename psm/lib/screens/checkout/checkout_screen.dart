import 'dart:async';

import 'package:flutter/material.dart';
import 'package:psm/models/catagory_model.dart';
import 'package:psm/widgets/widgets.dart';

import '../../models/models.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_bottomappbar.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController zipCodeController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: CustomBottomAppBar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'CUSTOMER INFO',
                style: Theme.of(context).textTheme.headline3,
              ),
              _buildTextFormField(emailController, context, 'Email'),
              _buildTextFormField(nameController, context, 'Name'),
              Text(
                'DELIVERY',
                style: Theme.of(context).textTheme.headline3,
              ),
              _buildTextFormField(addressController, context, 'Address'),
              _buildTextFormField(cityController, context, 'City'),
              _buildTextFormField(countryController, context, 'Country'),
              _buildTextFormField(zipCodeController, context, 'Zipcode'),
              Text(
                'ORDER SUMMARY',
                style: Theme.of(context).textTheme.headline3,
              ),
              OrderSummary(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildTextFormField(TextEditingController controller,
      BuildContext context, String labelText) {
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
              controller: controller,
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
