import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/readability/readable_instruction_label.dart';
import 'package:mars/business_logic/services/earth/commands/command_model.dart';
import 'package:mars/business_logic/services/earth/commands/commands_provider.dart';
import 'package:mars/business_logic/services/earth/ground_control/get_new_position.dart';
import 'package:mars/business_logic/services/earth/ground_control/robot_rotation.dart';
import 'package:mars/business_logic/services/mars/mars_panel/mars_panel_provider.dart';
import 'package:mars/business_logic/services/mars/robots/robot_model.dart';
import 'package:mars/business_logic/services/mars/robots/robots_provider.dart';
import 'package:mars/business_logic/services/mars/scents/scent_model.dart';
import 'package:mars/business_logic/services/mars/scents/scents_provider.dart';
import 'package:provider/provider.dart';

void runRobotCommands(
  BuildContext context,
  int robotIndex,
  String robotName,
) {
  final robotsProvider = Provider.of<RobotsProvider>(context, listen: false);
  final marsController =
      Provider.of<MarsPanelController>(context, listen: false);
  final scentsProvider = Provider.of<ScentsProvider>(context, listen: false);
  final commandsProvider = Provider.of<CommandProvider>(context, listen: false);

  // GROUND CONTROL INFORMATION//
  // CURRENT SIZE OF THE MARS GRID SYSTEM:

  final String _marsGridSystemCoordinates = '10 10';

  final List<String> _splitMarsGridCoordinates =
      _marsGridSystemCoordinates.split(' ');

  final int _xPositionForMarsGridSystem =
      int.parse(_splitMarsGridCoordinates[0]);

  final int _yPositionForMarsGridSystem =
      int.parse(_splitMarsGridCoordinates[1]);

  final Robot _robot =
      robotsProvider.robotsList[robotIndex]; // get our robot from the list.

  final String _robotPosition = _robot.robotPosition;

  bool _isRobotLost = false;

  String _robotOrientation = _robot.robotOrientation;

//🤖: Now turning robot's positions into separated integers...

  int _xPosition = int.parse(_robotPosition.split(' ')[0]);

  int _yPosition = int.parse(_robotPosition.split(' ')[1]);

//🤖: Ok, commander. Now
// We need to get the command lines that were assigned
//to this specific robot by the Commands Service Provider
//on Earth 🌍

  final List<Command> commandsListForRobot =
      commandsProvider.getCommandsListForRobot(robotIndex);

//🤖: Great, commander! We have one last thing to do before running the robot.
// We need to get the scents positions list from the Scents Provider.
// Robots must avoid these positions so They don't have the same fate!

  final List<String> scentsPositions = scentsProvider.listOfScentsPositions;

// Connecting with the Mars crew...

  _notifyMars(String notification) =>
      marsController.updatePanel(notification, robotIndex);

//🤖: Ok, now let the fun begin!!!
//Let's run each command line at a time.

  final int commandsListLength = commandsListForRobot.length;

  for (var commandIndex = 0;
      commandIndex < commandsListLength;
      commandIndex++) {
    if (_isRobotLost == true) {
      _notifyMars('🤖: Can\'t run line, robot is lost!');
    } else

      //🤖: Let's notify Mars about our progress.

      _notifyMars('🤖: Running command line $commandIndex for $robotName...');

    //🤖: Now We get the instructions from the current command running.

    final String instructions = commandsListForRobot[commandIndex].instructions;

    final List<String> instructionsList = instructions.split('');

    //🤖: Lets start running the instructions...

    instructionsList.forEach(
      (instruction) {
        if (_isRobotLost == true) {
          null;
        } else
          switch (instruction) {
            case 'R':
              {
                // gets new orientation
                String newOrientation = robotRotation(true, _robotOrientation);

                // updates robot service provider
                robotsProvider.updateRobotOrientation(
                    robotIndex, newOrientation);

                // get a readable label for the UI
                String readableOrientation =
                    readableOrientationLabel(newOrientation);

                // update local variable
                _robotOrientation = newOrientation;

                // notify the Mars Panel
                _notifyMars('🤖: $robotName is turning right...');

                // notify the Mars Panel
                _notifyMars(
                    '🤖: $robotName is now heading $readableOrientation');
              }
              break;

            case 'L':
              {
                // gets new orientation
                String newOrientation = robotRotation(false, _robotOrientation);

                // update robot service provider
                robotsProvider.updateRobotOrientation(
                    robotIndex, newOrientation);

                // get a readable label for the UI
                String readableOrientation =
                    readableOrientationLabel(newOrientation);

                // update local variable
                _robotOrientation = newOrientation;

                // notify the Mars Panel
                _notifyMars('🤖: $robotName is turning left...');

                // notify the Mars Panel
                _notifyMars(
                    '🤖: $robotName is now heading $readableOrientation');
              }
              break;

            case 'F':
              {
                // get current position as list of integers
                final List<int> oldPositionInt = [_xPosition, _yPosition];

                // get the new position
                final List<int> newPositionInt = getNewPosition(
                  _robotOrientation,
                  _xPosition,
                  _yPosition,
                  scentsPositions,
                );
                final newX = newPositionInt[0];
                final newY = newPositionInt[1];
                final String newPositionFormatted =
                    newX.toString() + ' ' + newY.toString();

                //🤖: We must notify Mars if the next position is safe
                _notifyMars(
                  newPositionInt == oldPositionInt
                      ? '🤖: New position is not safe, $robotName stays on the same position...'
                      : '🤖: $robotName is moving forward...',
                );

                //🤖: We must now check if the new postion is within the Mars System Grid boundaries.

                if (newX > _xPositionForMarsGridSystem ||
                    newX < 0 ||
                    newY > _yPositionForMarsGridSystem ||
                    newY < 0) {
                  //🤖: If It's not, then We must notify Mars Panel that we've lost the robot...

                  _notifyMars('🤖: $robotName is now lost forever! 😥');

                  //🤖: Update robot's operational status to lost, on the Robot Provider

                  robotsProvider.updateRobotOperationalStatus(robotIndex);

                  // update local variables
                  _isRobotLost = true;

                  //🤖: Update new scent to the scents list
                  scentsProvider
                      .addScent(Scent(newPositionFormatted, robotIndex));
                } else {
                  // update robot service provider about the new position
                  robotsProvider.updateRobotPosition(
                      robotIndex, newPositionFormatted);
                  _notifyMars(
                      '🤖: $robotName new position is: $newPositionFormatted');
                }

                // update local variables
                _xPosition = newX;
                _yPosition = newY;
              }
              break;
          }
      },
    );
    _notifyMars('🤖: Finished instructions');
  }

  _notifyMars('🤖: Finished running $robotName');
}
