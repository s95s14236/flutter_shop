import 'package:flutter/material.dart';
import 'package:top_queen/model/product.dart';


class CartBloc extends ChangeNotifier {

  final List<Product> _favProduct = [];

  List<Product> get favProduct => _favProduct;

  // The current total price of all items.
  // https://api.dart.dev/stable/1.10.1/dart-core/List/fold.html

  // Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Product product) {
    _favProduct.add(product);

    notifyListeners();
  }

}