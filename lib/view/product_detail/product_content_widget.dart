import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_queen/controller/productbloc.dart';
import 'package:top_queen/model/product.dart';
import 'package:top_queen/view/Theme.dart';
import 'package:top_queen/view/cart/cart.dart';
import 'package:top_queen/controller/bottombarbloc.dart';

class ProductContentWidget extends StatefulWidget {
  final Product product;
  final screenHeight;

  const ProductContentWidget({Key key, this.product, this.screenHeight})
      : super(key: key);

  @override
  _ProductContentWidgetState createState() => _ProductContentWidgetState();
}

class _ProductContentWidgetState extends State<ProductContentWidget> {
  List<String> size = ['xs', 's', 'M', 'L', 'XL'];

  String _currentSize = 'M';

  @override
  Widget build(BuildContext context) {
    var cartBloc = Provider.of<CartBloc>(context);
    var bottomBloc = Provider.of<BottomBarBloc>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: widget.screenHeight * 0.48),
          Row(
            children: <Widget>[
              Text('${widget.product.name}',
                  style: Theme.of(context).textTheme.title),
              Spacer(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'NT\$',
                        style: Theme.of(context).textTheme.headline),
                    TextSpan(
                        text: ' ${widget.product.price}',
                        style: Theme.of(context).textTheme.display1),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          // TODO: set 衣服size
          Row(
            children: <Widget>[
              Text('尺寸', style: TextStyle(fontSize: 18),),
              SizedBox(width: 15.0),
              DropdownButton(
                value: _currentSize,
                  items: size.map((size) {
                    return DropdownMenuItem(
                      value: size,
                      child: Text(size, style: TextStyle(fontSize: 20),),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _currentSize = val;
                    });
                  }),
            ],
          ),
          //SizedBox(height: 15.0),
          Divider(color: Colors.grey, thickness: 0.7),
          SizedBox(height: 15.0),
          //DropdownButton(items: , onChanged: null),
          Center(
            child: Container(
              height: 50.0,
              width: 220.0,
              child: cartBloc.cartProduct.contains(widget.product)
                  ? RaisedButton.icon(
                      icon: Icon(Icons.payment,
                          size: 25.0, color: tQueenBackGroundWhite),
                      label: Text(
                        ' 前往結帳',
                        style: TextStyle(
                            fontSize: 18.0, color: tQueenBackGroundWhite),
                      ),
                      color: Colors.pinkAccent,
                      onPressed: () {
                        bottomBloc.currentIndex = 2;
                        Navigator.pop(context);
                      })
                  : RaisedButton.icon(
                      icon: Icon(Icons.add_shopping_cart,
                          size: 25.0, color: tQueenBackGroundWhite),
                      label: Text(
                        ' 加入購物車',
                        style: TextStyle(
                            fontSize: 18.0, color: tQueenBackGroundWhite),
                      ),
                      color: Colors.grey[850],
                      onPressed: () => cartBloc.addCart(widget.product),
                    ),
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
