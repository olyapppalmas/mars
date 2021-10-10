import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';
import 'package:mars/interface/interface_models/type/type_models.dart';

Widget secondaryButton(
  BuildContext context,
  bool isLost,
) {
  return Container(
    width: reSize(context, 51),
    height: reSize(context, 33),
    color: isLost ? UNSELECTED_COLOR : NEUTRAL_BLACK,
    child: Center(
      child: typeLabelColorChange(
        context,
        'Run',
        isLost ? SECONDARY_TEXT_COLOR : NEUTRAL_WHITE,
      ),
    ),
  );
}
