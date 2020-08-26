import 'package:flutter/foundation.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String image;
  bool isFavorite;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      @required this.image,
      this.isFavorite = false});
}

class Recent {
  final String name;
  final String image;
  bool colorSet;

  Recent({
    @required this.name,
    @required this.image,
    @required this.colorSet
  });
}

final List<Product> loadedProducts = [
  Product(
    id: 'p1',
    title: 'Red Shirt',
    description: 'A red shirt - it is pretty red!',
    price: 29.99,
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    image: "images/D1001.png",
  ),
  Product(
    id: 'p2',
    title: 'Trousers',
    description: 'A nice pair of trousers.',
    price: 59.99,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    image: "images/D1002.png",
  ),
  Product(
    id: 'p3',
    title: 'Yellow Scarf',
    description: 'Warm and cozy - exactly what you need for the winter.',
    price: 19.99,
    imageUrl: 'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    image: "images/D1003.png",
  ),
  Product(
    id: 'p4',
    title: 'A Pan',
    description: 'Prepare any meal you want.',
    price: 49.99,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    image: "images/D1004.png",
  ),
  Product(
    id: 'p4',
    title: 'A Pan',
    description: 'Prepare any meal you want.',
    price: 49.99,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    image: "images/D1004.png",
  ),
  Product(
    id: 'p4',
    title: 'A Pan',
    description: 'Prepare any meal you want.',
    price: 49.99,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    image: "images/D1004.png",
  ),
  Product(
    id: 'p4',
    title: 'A Pan',
    description: 'Prepare any meal you want.',
    price: 49.99,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    image: "images/D1004.png",
  ),
  Product(
    id: 'p4',
    title: 'A Pan',
    description: 'Prepare any meal you want.',
    price: 49.99,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    image: "images/D1004.png",
  ),
];

List<Recent> recentList = [
  Recent(
    name: 'John',
    image: "images/gridPic/john.png",
    colorSet: false
  ),
  Recent(
    name: 'Sade',
    image: null,
    colorSet: false
  ),
  Recent(
    name: 'Alika',
    image: "images/gridPic/alika.png",
    colorSet: false
  ),
  Recent(
    name: 'Dola',
    image: "images/gridPic/dola.png",
    colorSet: false
  ),
  Recent(
    name: 'Chinara',
    image: null,
    colorSet: false
  ),
  Recent(
    name: 'Adola',
    image: "images/gridPic/john.png",
    colorSet: false
  ),
  Recent(
    name: 'Bolade',
    image: "images/gridPic/bolade.png",
    colorSet: false
  ),
  Recent(
    name: 'Ekon',
    image: null,
    colorSet: false
  ),
  Recent(
    name: 'Adanna',
    image: null,
    colorSet: false
  ),
  Recent(
    name: 'Obi',
    image: "images/gridPic/obi.png",
    colorSet: false
  ),


  Recent(
    name: 'John',
    image: "images/gridPic/john.png",
    colorSet: false
  ),
  Recent(
    name: 'Sade',
    image: null,
    colorSet: false
  ),
  Recent(
    name: 'Alika',
    image: "images/gridPic/alika.png",
    colorSet: false
  ),
  Recent(
    name: 'Dola',
    image: "images/gridPic/dola.png",
    colorSet: false
  ),
  Recent(
    name: 'Chinara',
    image: null,
    colorSet: false
  ),
  Recent(
    name: 'Adola',
    image: "images/gridPic/john.png",
    colorSet: false
  ),
  Recent(
    name: 'Bolade',
    image: "images/gridPic/bolade.png",
    colorSet: false
  ),
  Recent(
    name: 'Ekon',
    image: null,
    colorSet: false
  ),
  Recent(
    name: 'Adanna',
    image: null,
    colorSet: false
  ),
  Recent(
    name: 'Obi',
    image: "images/gridPic/obi.png",
    colorSet: false
  ),
];
