import 'package:flutter/material.dart';

class BottomBarBloc extends ChangeNotifier {
  int _currentIndex = 0;
  // TODO: BottomnavBar頁面呈現

  int get currentIndex => _currentIndex;

  set currentIndex(int val) {
    _currentIndex = val;
    notifyListeners();
  }

  // TODO: 刪掉Val看看
  void toCart(int val) {
    _currentIndex = 2;
    notifyListeners();
  }

}
