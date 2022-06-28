import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm/blocs/category/category_bloc.dart';
import 'package:psm/models/catagory_model.dart';
import 'package:psm/models/models.dart';

import '../../blocs/product/product_bloc.dart';
import '../../widgets/widgets.dart';

class OrderConfirmationScreen extends StatelessWidget {
  static const String routeName = '/orderconfirmation';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => OrderConfirmationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Thank You',
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 125,
                ),
                SizedBox(height: 10),
                Text(
                  "Order Confirmed",
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  child: Text(
                    "Return to Home",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.red;
                        }
                        return Colors.black;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
