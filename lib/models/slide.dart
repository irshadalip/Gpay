import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide(
      {@required this.imageUrl,
      @required this.title,
      @required this.description});
}

final slidelist = [
  Slide(
      imageUrl: 'images/pager_image.png',
      title: "A multi-currency account that saves you money.",
      description:
          "our customers saved more than \$ 1 billion in hidden fees last year."),
  Slide(
      imageUrl: 'images/pager_image.png',
      title: "A multi-currency account that saves you money.",
      description:
          "our customers saved more than \$ 1 billion in hidden fees last year."),
  Slide(
      imageUrl: 'images/pager_image.png',
      title: "A multi-currency account that saves you money.",
      description:
          "our customers saved more than \$ 1 billion in hidden fees last year."),
  Slide(
      imageUrl: 'images/pager_image.png',
      title: "A multi-currency account that saves you money.",
      description:
          "our customers saved more than \$ 1 billion in hidden fees last year."),
  Slide(
      imageUrl: 'images/pager_image.png',
      title: "A multi-currency account that saves you money.",
      description:
          "our customers saved more than \$ 1 billion in hidden fees last year.")
];
