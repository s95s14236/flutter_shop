import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_queen/controller/productbloc.dart';

class ProductDetailTopBar extends StatefulWidget {
  @override
  _ProductDetailTopBarState createState() => _ProductDetailTopBarState();
}

class _ProductDetailTopBarState extends State<ProductDetailTopBar> {
  
  Icon _favicon = Icon(Icons.favorite_border);
  
  @override
  Widget build(BuildContext context) {

    var favBloc = Provider.of<FavoriteBloc>(context);
    return Container(
      margin: EdgeInsets.only(top: 28.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // TODO: onpress
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Spacer(),
          // TODO: onpress
          IconButton(
            icon: _favicon,
            onPressed: () {
              setState(() {
                _favicon = Icon(Icons.favorite, color: Colors.red[800]);
              });
            },
          ),
        ],
      ),
    );
  }
}
