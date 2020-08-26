import 'package:flutter/foundation.dart';

class Airtime {
  final String image;

  Airtime({
    @required this.image,
  });
}


final List<Airtime> airtimeList = [
  Airtime(
    image: "images/airtime/drop.png",
  ),
  Airtime(
    image: "images/airtime/salary.png",
  ),
  Airtime(
    image: "images/airtime/Security.png",
  ),
  Airtime(
    image: "images/airtime/petrol.png",
  ),
  Airtime(
    image: null,
  ),
];