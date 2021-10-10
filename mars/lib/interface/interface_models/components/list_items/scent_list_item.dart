import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';
import 'package:mars/interface/interface_models/single_elements/tags_and_labels/tag.dart';
import 'package:mars/interface/interface_models/single_elements/icons/single_icons.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';
import 'package:mars/interface/interface_models/type/type_models.dart';

Widget scentListItem(
  BuildContext context,
  int xPosition,
  int yPosition,
  String robotName,
  int scentIndex,
) {
  return Container(
    margin: EdgeInsets.only(
      top: scentIndex == 0 ? reSize(context, 24) : 0,
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
    child: ListTile(
      leading: icon(context, Icons.chevron_right, NEUTRAL_BLACK),
      title: typeLabelColorChange(
        context,
        'From: ' + robotName,
        SECONDARY_TEXT_COLOR,
      ),
      subtitle: typeSubtitle(
        context,
        'Grid Point: ' + xPosition.toString() + ', ' + yPosition.toString(),
      ),
      trailing: tag(context, false, 'Today', false),
    ),
  );
}
