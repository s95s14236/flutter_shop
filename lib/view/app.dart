import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_queen/controller/bottombarbloc.dart';
import 'package:top_queen/controller/productbloc.dart';
import 'package:top_queen/view/home.dart';
import 'package:top_queen/view/login.dart';
import 'package:top_queen/view/Theme.dart';

class QueenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomBarBloc>(
            create: (context) => BottomBarBloc()),
        ChangeNotifierProvider<CartBloc>(
          create: (context) => CartBloc(),
        ),
        ChangeNotifierProvider<FavoriteBloc>(
          create: (context) => FavoriteBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        // TODO: 首頁設定
        //initialRoute: '/login',
        onGenerateRoute: _getRoute,
        // 改成自己品牌特色顏色
        theme: _tQueenTheme,
      ),
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }

  final ThemeData _tQueenTheme = buildQueenTheme();
}
