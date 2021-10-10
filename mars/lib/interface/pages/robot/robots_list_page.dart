import 'package:flutter/material.dart';
import 'package:mars/business_logic/services/mars/robots/robots_provider.dart';
import 'package:mars/interface/interface_models/components/list_items/robots_list_item.dart';
import 'package:mars/interface/interface_models/components/page_display/appbar_display.dart';
import 'package:mars/interface/interface_models/single_elements/buttons/secondary_button.dart';
import 'package:mars/interface/pages/robot/robot_profile_page.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';
import 'package:provider/provider.dart';

class RobotListPage extends StatefulWidget {
  const RobotListPage({Key? key}) : super(key: key);

  @override
  _RobotListPageState createState() => _RobotListPageState();
}

class _RobotListPageState extends State<RobotListPage> {
  @override
  Widget build(BuildContext context) {
    final robotsProvider = context.watch<RobotsProvider>();
    final robotsList = robotsProvider.robotsList;
    final robotsListLength = robotsProvider.robotsListLength;

    return SafeArea(
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        appBar: CustomAppBar('Robots'),
        body: ListView.builder(
          itemCount: robotsListLength,
          itemBuilder: (context, robotIndex) {
            final String robotName = robotsList[robotIndex].robotName;
            final String robotType = robotsList[robotIndex].type;
            final bool isRobotLost = robotsList[robotIndex].isLost;
            return robotListItemNavigation(
              context,
              robotType,
              isRobotLost,
              robotName,
              robotIndex,
              true,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RobotProfilePage(
                      Key('1'),
                      robotIndex,
                    ),
                  ),
                );
              },
              secondaryButton(context, isRobotLost),
            );
          },
        ),
      ),
    );
  }
}
