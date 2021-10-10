import 'package:flutter/material.dart';
import 'package:mars/business_logic/services/earth/commands/command_model.dart';

class CommandProvider extends ChangeNotifier {
  void _notify() => notifyListeners();

  List<Command> _commandsList = [
    Command('RFFFLFFRRFFFFFF', 0),
    Command('FFFFFR', 0),
  ];

  List<Command> get commandsList => _commandsList;

  addCommand(Command newCommand) {
    _commandsList.add(newCommand);
    _notify();
  }

  List<Command> getCommandsListForRobot(int robotIndex) {
    return commandsList
        .where((command) => command.robotIndex == robotIndex)
        .toList();
  }
}
