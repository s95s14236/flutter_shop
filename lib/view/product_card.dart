import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:top_queen/model/product.dart';
import 'package:top_queen/model/products_repository.dart';
import 'package:top_queen/view/product_detail/product_detail_page.dart';


class ProductCard extends StatefulWidget {
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  List<Product> products = ProductsRepository.loadProducts(Category.all);

  List<Card> _buildGridCards(BuildContext context) {
    //products = ProductsRepository.loadProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context); // 宣告ThemeData供後面顯示呼叫
    final NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'zh_TW');
    // 價格顯示先設為台灣，(也可根據使用者選取國家更改)

    return products.map((product) {
      return Card(
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
                product.assetName,
                package: product.assetPackage,
                // Adjust the box size (102)
                fit: BoxFit.cover, //默認為BoxFit.scaleDown 顯示 但很多空白多出來
              ),
            ),
            Expanded(
              // 填充可用空間 放 name, price
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 12.0),
                child: Column(
                  // Align labels to the bottm and center (103)
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // change innermost column (103)
                  children: <Widget>[
                    Text(
                      product == null ? '' : product.name,
                      style: theme.textTheme.button,
                      softWrap: false, // 文本是否應在換行符處中斷。
                      overflow: TextOverflow.ellipsis, // 文本過長溢出
                      maxLines: 1,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      product == null ? '' : formatter.format(product.price),
                      style: theme.textTheme.caption,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _buildGridCards(context).length, // item數量=card list長度
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 因為scroll方向為垂直，水平呈現 2 cards
        childAspectRatio: 30 / 47, // 寬長比(高適寬的9/8倍)
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            // TODO: 點擊Card動作
            onTap: () {
              print(products[index]);
              Navigator.push(
                context,
                //FadePageRoute(widget: ProductDetailPage(product: products[index])),
                MaterialPageRoute(
                  // TODO: 傳參數
                  builder: (context) => ProductDetailPage(
                    product: products[index],
                  ),
                ),
              );
            },
            child: Hero(
                tag: products[index].id,
                child: _buildGridCards(context)[index]));
      },
    );
  }
}

/*class _CartAddButton extends StatelessWidget {
  final Product product;
  _CartAddButton({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //var cart = Provider.of<CartBloc>(context);

    return IconButton(
      icon: Icon(Icons.add_shopping_cart),
      // contains: https://api.dart.dev/stable/2.7.2/dart-core/String/contains.html
      onPressed: cart.cartProduct.contains(product) ? null : () => cart.add(product),
      color: cart.cartProduct.contains(product)? Colors.pinkAccent : Colors.grey,
      );
  }
}*/
