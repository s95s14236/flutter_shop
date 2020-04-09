import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:top_queen/model/product.dart';

class ProductDetailBackground extends StatelessWidget {
  final screenHeight, screenWidth;
  final Product product;
  const ProductDetailBackground(
      {Key key, this.screenHeight, this.screenWidth, @required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Stack(
        //fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: product.id,
            child: Container(
              height: screenHeight * 0.5,
              width: screenWidth,
              //decoration: BoxDecoration(shape: BoxShape.rectangle, color: Color(0xFF0000FF)),
              child: Carousel(
                autoplay: false,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 0),
                dotSize: 4.0,
                dotIncreasedColor: Colors.grey[800],
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 8.0,
                images: [
                  Image.asset(
                    '${product.id}-0.jpg',
                    fit: BoxFit.cover,
                    package: 'shrine_images',
                  ),
                  Image.asset(
                    '${product.id}-0.jpg',
                    fit: BoxFit.cover,
                    package: 'shrine_images',
                  ),
                  Image.asset(
                    '${product.id}-0.jpg',
                    fit: BoxFit.cover,
                    package: 'shrine_images',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
