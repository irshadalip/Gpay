import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
          height: 80,
          width: 80,
          color: Colors.blue,
          child: Center(child: Image.asset("images/nigeria_flage.png"))),
    );
  }
}
