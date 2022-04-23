import 'package:flutter/material.dart';
import 'package:psm/models/models.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_bottomappbar.dart';
import '../../widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => WishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Wishlist',
      ),
      bottomNavigationBar: CustomBottomAppBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.15,
        ),
        itemCount: Product.products.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: ProductCard(
              product: Product.products[index],
              widthFactor: 2.2,
            ),
          );
        },
      ),
    );
  }
}
