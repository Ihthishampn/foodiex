import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void changeIndex(int i) {
    if (_index == i) return;
    _index = i;
    notifyListeners();
  }
}




