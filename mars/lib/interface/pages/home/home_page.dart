import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/app_state.dart';
import 'package:mars/interface/interface_models/components/page_display/bottom_bar_display.dart';
import 'package:mars/interface/interface_models/single_elements/buttons/floating_action_button.dart';
import 'package:mars/interface/pages/mars/commander_profile_page.dart';
import 'package:mars/interface/pages/robot/robots_list_page.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final tabs = [
    CommanderProfilePage(),
    RobotListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final index = context.watch<StateController>().tabIndex;
    return SafeArea(
      child: Scaffold(
        body: tabs[index],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: BACKGROUND_COLOR,
        bottomNavigationBar: bottomNavigationBar(context, index),
        floatingActionButton: floatingActionButton(context, () {}),
      ),
    );
  }
}
