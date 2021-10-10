import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';
import 'package:mars/interface/interface_models/components/list_items/icon_list_item.dart';
import 'package:mars/interface/interface_models/single_elements/dividers/full_width_divider.dart';
import 'package:mars/interface/pages/mars/scents_list_page.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';
import 'package:mars/interface/style_guide/space_models.dart';

Widget contentListCard(
  BuildContext context,
  int operationalRobots,
  int lostRobots,
) {
  return Container(
    margin: EdgeInsets.only(
      top: reSize(context, 0),
      bottom: reSize(context, 24),
      right: reSize(context, 16),
      left: reSize(context, 16),
    ),
    padding: EdgeInsets.all(
      reSize(context, 16),
    ),
    decoration: BoxDecoration(
      color: NEUTRAL_WHITE,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.05),
          spreadRadius: 8,
          blurRadius: 7,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        space(context, 8),
        iconListItem(
          context,
          Icons.smart_toy_outlined,
          'Operational Robots',
          operationalRobots.toString(),
          false,
        ),
        space(context, 24),
        divider(context),
        space(context, 24),
        iconListItem(
          context,
          Icons.report_gmailerrorred,
          'Lost Robots',
          lostRobots.toString(),
          false,
        ),
        space(context, 24),
        divider(context),
        space(context, 24),
        iconListItemNavigation(
          context,
          Icons.inventory_rounded,
          'Scent List',
          '',
          true,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScentListPage(),
              ),
            );
          },
        ),
        space(context, 8),
      ],
    ),
  );
}
