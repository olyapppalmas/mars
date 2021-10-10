import 'package:flutter/cupertino.dart';
import 'package:mars/business_logic/services/earth/ground_control/run_commands.dart';
import 'package:mars/business_logic/services/mars/mars_panel/mars_panel_provider.dart';
import 'package:mars/business_logic/services/mars/robots/robot_model.dart';
import 'package:mars/business_logic/services/mars/robots/robots_provider.dart';
import 'package:provider/provider.dart';

void start(BuildContext context, int robotIndex) {
  //🤖: Hi, commander!
  // First things first. We need to know if the robot is operational.

  final robotsProvider = Provider.of<RobotsProvider>(context, listen: false);

  final marsController =
      Provider.of<MarsPanelController>(context, listen: false);

// 🤖: We need to get the robot's information from the Robots Service Provider on Mars.
// They provide us with the newest information on the Mars Mission's robots.
// Every robot has an index used to identify then properly.

  final Robot robot =
      robotsProvider.robotsList[robotIndex]; // get our robot from the list.

  final String robotName = robot.robotName;

// 🤖: Now We know the operational status of the robot

  final bool isRobotLost = robot.isLost;

//🤖: Connecting to Mars Panel...

  _notifyMars(String notification) =>
      marsController.updatePanel(notification, robotIndex);

  isRobotLost

      //🤖: If the robot is lost, notify Mars that this robot is out of service.

      ? _notifyMars('🤖: We can\'t run $robotName. It\'s lost forever 😥')

      //🤖: If the robot is not lost, start to run the commands.

      : runRobotCommands(context, robotIndex, robotName);
}
