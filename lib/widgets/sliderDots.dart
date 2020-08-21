import 'package:flutter/material.dart';

class SliderDots extends StatelessWidget {
  bool isActive;
  SliderDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 10,
      width: 10,
      // width: isActive ? 10 : 8,
      decoration: BoxDecoration(
        color: isActive ? Color(0xff003844) : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
