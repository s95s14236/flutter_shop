import 'package:flutter/material.dart';

import 'package:top_queen/view/product_detail/product_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:top_queen/controller/productbloc.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    var favBloc = Provider.of<FavoriteBloc>(context);

    return GridView.builder(
      itemCount: favBloc.favProduct.length, // item數量=card list長度
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 因為scroll方向為垂直，水平呈現 2 cards
        childAspectRatio: 30 / 47, // 寬長比(高適寬的9/8倍)
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          // 點擊Card動作
          onTap: () {
            //print(products[index]);
            Navigator.push(
              context,
              //FadePageRoute(widget: ProductDetailPage(product: products[index])),
              MaterialPageRoute(
                // TODO: 傳參數
                builder: (context) => ProductDetailPage(
                  product: favBloc.favProduct[index],
                ),
              ),
            );
          },
          child: Hero(
            tag: favBloc.favProduct[index].id,
            child: Card(
              clipBehavior: Clip.antiAlias,
              // Adjust card heights (103)
              elevation: 0.0,
              color: Colors.white,
              child: Column(
                // Center items on the card (103)
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 12 / 14,
                    child: Image.asset(
                      favBloc.favProduct[index].assetName,
                      package: favBloc.favProduct[index].assetPackage,
                      // Adjust the box size (102)
                      fit: BoxFit.cover, //默認為BoxFit.scaleDown 顯示 但很多空白多出來
                    ),
                  ),
                  Expanded(
                    // 填充可用空間 放 name, price
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 10.0),
                      child: Column(
                        // Align labels to the bottm and center (103)
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // change innermost column (103)
                        children: <Widget>[
                          Text(
                            favBloc.favProduct[index] == null
                                ? ''
                                : favBloc.favProduct[index].name,
                            style: Theme.of(context).textTheme.button,
                            softWrap: false, // 文本是否應在換行符處中斷。
                            overflow: TextOverflow.ellipsis, // 文本過長溢出
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// class _FavoriteCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       clipBehavior: Clip.antiAlias,
//       // Adjust card heights (103)
//       elevation: 0.0,
//       color: Colors.white,
//       child: Column(
//         // Center items on the card (103)
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           AspectRatio(
//             aspectRatio: 10 / 14,
//             child: Image.asset(
//               favorite.favProduct[index].assetName,
//               package: favorite.favProduct[index].assetPackage,
//               // Adjust the box size (102)
//               fit: BoxFit.cover, //默認為BoxFit.scaleDown 顯示 但很多空白多出來
//             ),
//           ),
//           // Expanded(
//           //   // 填充可用空間 放 name, price
//           //   child: Padding(
//           //     padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 12.0),
//           //     child: Column(
//           //       // Align labels to the bottm and center (103)
//           //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //       crossAxisAlignment: CrossAxisAlignment.center,
//           //       // change innermost column (103)
//           //       children: <Widget>[
//           //         Text(
//           //           product == null ? '' : product.name,
//           //           style: theme.textTheme.button,
//           //           softWrap: false, // 文本是否應在換行符處中斷。
//           //           overflow: TextOverflow.ellipsis, // 文本過長溢出
//           //           maxLines: 1,
//           //         ),
//           //         SizedBox(height: 4.0),
//           //         Text(
//           //           product == null ? '' : formatter.format(product.price),
//           //           style: theme.textTheme.caption,
//           //         )
//           //       ],
//           //     ),
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }
