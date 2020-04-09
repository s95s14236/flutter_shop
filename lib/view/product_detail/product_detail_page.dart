import 'package:flutter/material.dart';
import 'package:top_queen/model/product.dart';
import 'package:top_queen/view/product_detail/product_content_widget.dart';
import 'package:top_queen/view/product_detail/product_detail_bg.dart';
import 'package:top_queen/view/product_detail/product_detail_content.dart';
//import 'package:top_queen/view/product_detail/product_detail_topbar.dart';

import 'package:provider/provider.dart';
import 'package:top_queen/controller/productbloc.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({Key key, @required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Icon _favicon = Icon(Icons.favorite_border);

  @override
  Widget build(BuildContext context) {
    final FavoriteBloc favBloc = Provider.of<FavoriteBloc>(context, listen: true);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            ProductDetailBackground(product: widget.product),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
// =====================   ProductDetail TopBar  =============================
                Container(
                  margin: EdgeInsets.only(top: 28.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // onpress
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Spacer(),
                      // onpress
                      favBloc.favProduct.contains(widget.product) ?
                      // 已加入
                      IconButton(
                        icon: Icon(Icons.favorite, color: Colors.pink[600]),
                        onPressed: () => favBloc.delFav(widget.product, _favicon),
                      ) :
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () => favBloc.addFav(widget.product, _favicon),
                      ),
                    ],
                  ),
                ),
// ==========================================================================
                ProductContentWidget(
                    product: widget.product, screenHeight: screenHeight),
                //ProductDetailContent(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class ProductDetailTopBar extends StatefulWidget {
//   @override
//   _ProductDetailTopBarState createState() => _ProductDetailTopBarState();
// }

// class _ProductDetailTopBarState extends State<ProductDetailTopBar> {
//   Icon _favicon = Icon(Icons.favorite_border);

//   @override
//   Widget build(BuildContext context) {
//     var favBloc = Provider.of<FavoriteBloc>(context);

//     return Container(
//       margin: EdgeInsets.only(top: 28.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           // TODO: onpress
//           IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           Spacer(),
//           // TODO: onpress
//           IconButton(
//             icon: _favicon,
//             onPressed: favBloc.favProduct.contains(widget.product)
//                 ? null
//                 : () => favBloc.addFav(widget.product),
//           ),
//         ],
//       ),
//     );
//   }
// }
