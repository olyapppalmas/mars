import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';
import 'package:mars/interface/interface_models/single_elements/icons/single_icons.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';

Widget circledIcon(
  BuildContext context,
  IconData iconData,
) {
  return Container(
    width: reSize(context, 48),
    height: reSize(context, 48),
    decoration: new BoxDecoration(
      color: ACCENT_COLOR,
      shape: BoxShape.circle,
    ),
    child: Center(
      child: icon(context, iconData, NEUTRAL_BLACK),
    ),
  );
}
