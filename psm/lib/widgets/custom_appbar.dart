import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      centerTitle: true,
      title: Container(
        color: Colors.white,
        child: Text(title, style: Theme.of(context).textTheme.headline2),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/wishlist');
            },
            icon: Icon(Icons.favorite))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
