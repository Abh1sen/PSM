import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm/models/cart_model.dart';

import '../../blocs/cart/bloc/cart_bloc.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Cart',
        ),
        bottomNavigationBar: BottomAppBar(
          child: CustomBottomAppBar(screen: '/cart'),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          state.cart.freedeliveryString,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: 400,
                          child: ListView.builder(
                              itemCount: state.cart
                                  .productQuantity(state.cart.products)
                                  .keys
                                  .length,
                              itemBuilder: (context, index) {
                                return CartProductCard(
                                  product: state.cart
                                      .productQuantity(state.cart.products)
                                      .keys
                                      .elementAt(index),
                                  quantity: state.cart
                                      .productQuantity(state.cart.products)
                                      .values
                                      .elementAt(index),
                                );
                              }),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Divider(
                          thickness: 3.0,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'SUBTOTAL ',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                  Text(
                                    'Rp${state.cart.subtotalString}',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'DELIVERY ',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                  Text(
                                    'Rp${state.cart.deliveryfeeString}',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(50),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.all(5.0),
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.black,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'TOTAL ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(color: Colors.white),
                                    ),
                                    Text(
                                      'Rp${state.cart.totalString}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Text('Something went wrong');
            }
          },
        ));
  }
}
