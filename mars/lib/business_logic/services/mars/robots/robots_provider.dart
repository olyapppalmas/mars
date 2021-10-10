import 'package:flutter/material.dart';
import 'package:mars/business_logic/services/mars/robots/robot_model.dart';

class RobotsProvider extends ChangeNotifier {
  void _notify() => notifyListeners();

  List<Robot> _robotsList = [
    Robot(false, 0, 'Robot Jorge', 'N', '0 6', 'type 2'),
    Robot(true, 1, 'Robot Gabriel', 'S', '8 12', 'type 3'),
    Robot(true, 2, 'Robot Rômulo', 'W', '5 10', 'type 1'),
  ];

  List<Robot> get robotsList => _robotsList;

  int get robotsListLength => robotsList.length;

  int get numberOfOperationalRobots =>
      robotsList.where((robot) => robot.isLost == false).length;

  int get numberOfLostRobots => robotsListLength - numberOfOperationalRobots;

  updateRobotOperationalStatus(int index) {
    _robotsList[index].isLost = true;
    _notify();
  }

  updateRobotPosition(int index, String newPosition) {
    _robotsList[index].robotPosition = newPosition;
    _notify();
  }

  updateRobotOrientation(int index, String newOrientation) {
    _robotsList[index].robotOrientation = newOrientation;
    print('ROBOT ORIENTATION UPDATED TO: $newOrientation');
    _notify();
  }

  addNewRobot(Robot robot) {
    _robotsList.add(robot);
    _notify();
  }
}
