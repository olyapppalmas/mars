import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/app_state.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';
import 'package:provider/provider.dart';

Widget bottomNavigationBar(
  BuildContext context,
  int currentIndex,
) {
  final stateController = Provider.of<StateController>(context, listen: false);
  return BottomNavigationBar(
    showSelectedLabels: false,
    showUnselectedLabels: false,
    elevation: 0,
    type: BottomNavigationBarType.fixed,
    iconSize: reSize(context, 24),
    selectedItemColor: NEUTRAL_BLACK,
    unselectedItemColor: UNSELECTED_COLOR,
    backgroundColor: NEUTRAL_WHITE,
    onTap: (newIndex) {
      stateController.changeTab(newIndex);
    },
    currentIndex: currentIndex,
    items: [
      BottomNavigationBarItem(
        label: 'Hooman Profile',
        icon: Icon(
          Icons.person_outline_outlined,
          size: reSize(context, 24),
        ),
      ),
      BottomNavigationBarItem(
        backgroundColor: Colors.white,
        label: 'Robot List',
        icon: Icon(
          Icons.smart_toy_outlined,
          size: reSize(context, 24),
        ),
      ),
    ],
  );
}
