import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm/blocs/cart/bloc/cart_bloc.dart';
import 'package:psm/blocs/checkout/checkout_bloc.dart';

import '../blocs/wishlist/bloc/wishlist_bloc.dart';
import '../models/models.dart';

class CustomBottomAppBar extends StatelessWidget {
  final String screen;
  final Product? product;

  const CustomBottomAppBar({
    Key? key,
    required this.screen,
    this.product,
  }) : super(key: key);

  //Todo change this below to be more dynamic
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _selectNavBar(context, screen)!,
        ),
      ),
    );
  }

  List<Widget>? _selectNavBar(context, screen) {
    switch (screen) {
      case '/':
        return _buildNavBar(context);
      case '/catalog':
        return _buildNavBar(context);
      case '/wishlist':
        return _buildNavBar(context);
      case '/product':
        return _buildAddToCartNavBar(context, product);
      case '/cart':
        return _buildGoToCheckoutNavBar(context);
      case '/checkout':
        return _buildOrderNowNavBar(context);
      default:
        return _buildNavBar(context);
    }
  }

  List<Widget> _buildNavBar(context) {
    return [
      IconButton(
          icon: Icon(
            Icons.home,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          }),
      IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          }),

      //Todo update the routing into logout page after login
      IconButton(
          icon: Icon(
            Icons.person,
            color: Colors.black,
          ),
          onPressed: () {
            FirebaseAuth.instance.currentUser == null
                ? Navigator.pushNamed(context, '/login')
                : Navigator.pushNamed(context, '/logout');
          }),
    ];
  }

  List<Widget> _buildAddToCartNavBar(context, product) {
    return [
      BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          return IconButton(
              onPressed: () {
                context.read<WishlistBloc>().add(AddWishListProduct(product));

                final snackBar = SnackBar(content: Text('Added to Wishlist!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: Icon(Icons.favorite));
        },
      ),
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () {
                context.read<CartBloc>().add(CartProductAdded(product));
                Navigator.pushNamed(context, '/cart');
              },
              child: Text(
                'ADD TO CART',
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
              ));
        },
      ),
    ];
  }

  List<Widget> _buildGoToCheckoutNavBar(context) {
    return [
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/checkout');
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          shape: RoundedRectangleBorder(),
        ),
        child: Text(
          'GO TO CHECKOUT',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white),
        ),
      ),
    ];
  }

  List<Widget> _buildOrderNowNavBar(context) {
    return [
      BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CheckoutLoaded) {
            return ElevatedButton(
              onPressed: () {
                context
                    .read<CheckoutBloc>()
                    .add(ConfirmCheckout(checkout: state.checkout));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(),
              ),
              child: Text(
                'ORDER NOW',
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
              ),
            );
          } else {
            return Text('Oops! Something went wrong! :(');
          }
        },
      ),
    ];
  }
}
