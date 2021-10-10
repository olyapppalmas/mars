import 'package:flutter/material.dart';

class StateController extends ChangeNotifier {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  void _notify() => notifyListeners();

  changeTab(int newIndex) {
    _tabIndex = newIndex;
    _notify();
  }
}
