import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_queen/controller/bottombarbloc.dart';
import 'package:top_queen/view/favorite/favorite.dart';
import 'package:top_queen/view/product_card.dart';
import 'package:top_queen/view/personal.dart';
import 'package:top_queen/view/cart/cart.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // TODO: BottomnavBar頁面呈現
  List<Widget> pages = [
    ProductCard(),
    Favorite(),
    Cart(),
    PersonalPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final BottomBarBloc bottombarBloc = Provider.of<BottomBarBloc>(context);
    print('root build called');
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Top Queen'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            // TODO: search function
            onPressed: () {
              print('search');
            },
          ),
        ],
      ),
      body: pages[bottombarBloc.currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.white,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.black,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.grey[600]))),
        // sets the inactive color of the `BottomNavigationBar`
        child: BottomNavigationBar(
          currentIndex: bottombarBloc.currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12.0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('購物'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('喜歡'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text('購物車'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('個人'),
            ),
          ],
          onTap: (index) {
            bottombarBloc.currentIndex = index;
          },
        ),
      ),
    );
  }
}
