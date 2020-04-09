import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:top_queen/controller/productbloc.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 固定總價格
        Expanded(
          child: Container(
            child: _CartList(),
          ),
        ),
        Divider(
          thickness: 1,
          height: 0.0,
        ),
        Container(
          height: 60.0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32.0, 12.0, 32.0, 12.0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('總計:   ', style: Theme.of(context).textTheme.title),
                _CartTotal(),
                Spacer(),
                Container(
                  width: 120.0,
                  child: RaisedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.payment),
                      label: Text('Pay')),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartBloc>(context);

    return ListView.builder(
      itemCount: cart.cartProduct.length,
      itemBuilder: (context, index) => Dismissible(
        key: Key(cart.cartProduct[index].toString()),
        onDismissed: (direction) {
          cart.delCart(cart.cartProduct[index]);
        },
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: SizedBox(
                width: 100.0,
                child: Image.asset(
                  cart.cartProduct[index].assetName,
                  package: cart.cartProduct[index].assetPackage,
                  fit: BoxFit.cover,
                  height: 80.0,
                ),
              ),
              title: Text(
                cart.cartProduct[index].name,
              ),
              subtitle: Row(
                children: <Widget>[
                  Text('\$ '),
                  Text(cart.cartProduct[index].price.toString()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartBloc>(
        builder: (context, cartBloc, child) => Text('\$ ${cartBloc.totalPrice}',
            style: Theme.of(context).textTheme.headline));
  }
}
