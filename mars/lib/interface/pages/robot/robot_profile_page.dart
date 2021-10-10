import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/readability/readable_instruction_label.dart';
import 'package:mars/business_logic/services/earth/commands/commands_provider.dart';
import 'package:mars/business_logic/services/earth/ground_control/start.dart';
import 'package:mars/business_logic/services/mars/mars_panel/mars_panel_provider.dart';
import 'package:mars/business_logic/services/mars/robots/robot_model.dart';
import 'package:mars/business_logic/services/mars/robots/robots_provider.dart';
import 'package:mars/interface/interface_models/single_elements/buttons/primary_button.dart';
import 'package:mars/interface/interface_models/components/list_items/command_line_list_item.dart';
import 'package:mars/interface/interface_models/components/list_items/content_list_item.dart';
import 'package:mars/interface/interface_models/components/list_items/robots_list_item.dart';
import 'package:mars/interface/interface_models/components/page_display/appbar_display.dart';
import 'package:mars/interface/interface_models/single_elements/buttons/secondary_button.dart';
import 'package:mars/interface/interface_models/single_elements/dividers/full_width_divider.dart';
import 'package:mars/interface/pages/mars/mars_panel.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';
import 'package:mars/interface/style_guide/space_models.dart';
import 'package:mars/interface/interface_models/type/type_models.dart';
import 'package:provider/provider.dart';

class RobotProfilePage extends StatefulWidget {
  final int robotIndex;

  const RobotProfilePage(
    Key? key,
    this.robotIndex,
  ) : super(key: key);

  @override
  _RobotProfilePageState createState() => _RobotProfilePageState();
}

class _RobotProfilePageState extends State<RobotProfilePage> {
  @override
  Widget build(BuildContext context) {
    final commandsProvider = context.watch<CommandProvider>();
    final commandsList =
        commandsProvider.getCommandsListForRobot(widget.robotIndex);
    final marsPanelController = context.watch<MarsPanelController>();
    final String latestUpdate = marsPanelController.latestUpdate;
    final robotsProvider = context.watch<RobotsProvider>();
    final robotsList = robotsProvider.robotsList;
    final Robot thisRobot = robotsList[widget.robotIndex];
    final String robotName = thisRobot.robotName;
    final bool isRobotLost = thisRobot.isLost;
    final String robotType = thisRobot.type;
    final String robotPosition = thisRobot.robotPosition;
    final String robotOrientation = thisRobot.robotOrientation;
    return SafeArea(
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        appBar: CustomAppBar('Robot Profile'),
        body: ListView(
          children: [
            robotListItem(
              context,
              robotType,
              isRobotLost,
              robotName,
              widget.robotIndex,
              false,
              InkWell(
                splashColor: NEUTRAL_WHITE,
                onTap: () {
                  print('START!!');
                  start(context, widget.robotIndex);
                },
                child: secondaryButton(
                  context,
                  isRobotLost,
                ),
              ),
            ),
            divider(context),
            space(context, 24),
            Center(child: typeLabel(context, 'Latest Update:')),
            space(context, 4),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MarsPanelPage(),
                  ),
                );
              },
              child: Container(
                  child: Center(child: typeSubtitle(context, latestUpdate))),
            ),
            space(context, 24),
            divider(context),
            space(context, 24),
            contentListItem(
              context,
              readablePositionLabel(robotPosition),
              'Current Position:',
            ),
            divider(context),
            space(context, 24),
            contentListItem(
              context,
              readableOrientationLabel(robotOrientation),
              'Current Orientation:',
            ),
            divider(context),
            space(context, 24),
            Center(child: typeBody(context, 'Commands List:')),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: commandsList.length,
              itemBuilder: (context, commandIndex) {
                final String instructions =
                    commandsList[commandIndex].instructions;
                return commandListItem(context, commandIndex, instructions);
              },
            ),
            primaryButton(context, true, 'Create Command', () {}),
            space(context, 24),
          ],
        ),
      ),
    );
  }
}
