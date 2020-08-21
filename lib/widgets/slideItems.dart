import 'package:Gpay/models/slide.dart';
import 'package:flutter/material.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.redAccent,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60, bottom: 30,top: 90),
            child: Image.asset(slidelist[index].imageUrl,fit: BoxFit.fitWidth,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Text(
              slidelist[index].title,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, color: Color(0xff003844)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45, top: 20),
            child: Text(
              slidelist[index].description,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Color(0xff003844)),
            ),
          )
        ],
      ),
    );
  }
}
