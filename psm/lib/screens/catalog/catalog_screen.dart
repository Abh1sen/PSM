import 'package:flutter/material.dart';
import 'package:psm/models/catagory_model.dart';
import 'package:psm/widgets/widgets.dart';

import '../../models/models.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_bottomappbar.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  final Category category;

  const CatalogScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: category.name,
        ),
        bottomNavigationBar: CustomBottomAppBar(),
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.15,
          ),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: ProductCard(
                product: Product.products[0],
              ),
            );
          },
        ));
  }
}
