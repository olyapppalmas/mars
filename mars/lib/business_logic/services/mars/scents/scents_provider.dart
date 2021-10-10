import 'package:flutter/material.dart';
import 'package:mars/business_logic/services/mars/scents/scent_model.dart';

class ScentsProvider extends ChangeNotifier {
  void _notify() => notifyListeners();
  List<Scent> _scentsList = [
    Scent('8 12', 1),
    Scent('3 8', 2),
  ];

  List<Scent> get scentsList => _scentsList;

  List<String> get listOfScentsPositions => List<String>.generate(
      _scentsList.length, (index) => _scentsList[index].scentPosition);

  addScent(Scent newScent) {
    _scentsList.add(newScent);
    _notify();
  }
}
