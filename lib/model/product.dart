import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

enum Category {
  all,
  accessories,
  coat,
  pants,
}

class Product {
  final Category category;
  final int id;
  final bool isFeatured; // 精選product
  //final bool isFavorited;
  //final bool isCarted;
  final String name;
  final int price;
  //final String picture;

  const Product({
    @required this.category,
    @required this.id,
    @required this.isFeatured,
    //@required this.isFavorited,
    //@required this.isCarted,
    @required this.name,
    @required this.price,
    //@required this.picture,
  })  : assert(category != null),
        assert(id != null),
        assert(isFeatured != null),
        //assert(isFavorited != null),
        //assert(isCarted != null),
        assert(name != null),
        assert(price != null);
        //assert(picture != null);

  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shrine_images';

  @override
  String toString() => "$name (id=$id)";
}
