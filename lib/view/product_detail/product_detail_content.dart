import 'package:flutter/material.dart';
import 'package:top_queen/model/product.dart';
import 'package:top_queen/view/product_detail/product_detail_topbar.dart';

class ProductDetailContent extends StatefulWidget {
  final Product product;
  const ProductDetailContent({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailContentState createState() => _ProductDetailContentState();
}

class _ProductDetailContentState extends State<ProductDetailContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
        ],
      ),
    );
  }
}
