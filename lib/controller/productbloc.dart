import 'package:flutter/material.dart';
import 'package:top_queen/model/product.dart';


class CartBloc extends ChangeNotifier {

  final List<Product> _cartProduct = [];

  List<Product> get cartProduct => _cartProduct;

  // The current total price of all items.
  // https://api.dart.dev/stable/1.10.1/dart-core/List/fold.html
  int get totalPrice => _cartProduct.fold(0, (total, current) => total + current.price);

  // Adds [item] to cart. This is the only way to modify the cart from outside.
  void addCart(Product product) {
    _cartProduct.add(product);

    notifyListeners();
  }

  void delCart(Product product) {
    _cartProduct.removeWhere((item) => item == product);
    notifyListeners();
  }

}


class FavoriteBloc extends ChangeNotifier {

  final List<Product> _favProduct = [];

  List<Product> get favProduct => _favProduct;

  Icon _favicon;

  Icon get favicon => _favicon;

  // The current total price of all items.
  // https://api.dart.dev/stable/1.10.1/dart-core/List/fold.html
  //int get totalPrice => _favProduct.fold(0, (total, current) => total + current.price);

  // Adds [item] to cart. This is the only way to modify the cart from outside.
  void addFav(Product product, Icon favIcon) {
    favIcon = Icon(Icons.favorite, color: Colors.pink[600]);
    _favProduct.add(product);

    notifyListeners();
  }

  void delFav(Product product, Icon favIcon) {
    favIcon = Icon(Icons.favorite_border);
    _favProduct.removeWhere((item) => item == product);
  }


}