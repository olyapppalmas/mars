import 'package:flutter/material.dart';

import 'mars_panel_update_model.dart';

class MarsPanelController extends ChangeNotifier {
  void _notify() => notifyListeners();
  List<PanelUpdate> _panelUpdates = [
    PanelUpdate('🤖: Welcome home, Hooman!', 0),
  ];

  List<PanelUpdate> get panelUpdates => _panelUpdates;

  String get latestUpdate => _panelUpdates.last.updateString;

  String get latestUpdateOnThisRobot =>
      _panelUpdates.where((element) => false).last.updateString;

  updatePanel(String newUpdate, int robotIndex) {
    _panelUpdates.add(PanelUpdate(newUpdate, robotIndex));
    _notify();
  }
}
