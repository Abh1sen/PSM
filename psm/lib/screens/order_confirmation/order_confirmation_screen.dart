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
        title: 'Order Confirmed',
      ),
      bottomNavigationBar: CustomBottomAppBar(screen: routeName),
      body: SizedBox(),
    );
  }
}
