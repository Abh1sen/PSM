import 'package:flutter/material.dart';

class SizeList extends StatefulWidget {
  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> sizeList = ['S', 'M', 'L', 'XL', 'XXL'];
  var currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
          itemBuilder: (context, index) => Container(
                child: Text(sizeList[index],
                    style: currentSelected == index
                        ? Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.red)
                        : Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.blue)),
              ),
          separatorBuilder: (_, index) => SizedBox(
                width: 10,
              ),
          itemCount: sizeList.length),
    );
  }
}
