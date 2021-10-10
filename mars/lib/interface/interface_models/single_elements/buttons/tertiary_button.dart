import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';
import 'package:mars/interface/interface_models/single_elements/icons/single_icons.dart';
import 'package:mars/interface/interface_models/type/type_models.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';

Widget tertiaryButton(
  BuildContext context,
  bool darkBG,
  String label,
  Function function,
) {
  return GestureDetector(
    onTap: function(),
    child: Container(
      width: reSize(context, 112),
      height: reSize(context, 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          typeLabelColorChange(
            context,
            label,
            darkBG ? NEUTRAL_WHITE : NEUTRAL_BLACK,
          ),
          icon(
            context,
            Icons.chevron_right,
            darkBG ? NEUTRAL_WHITE : NEUTRAL_BLACK,
          ),
        ],
      ),
      padding: EdgeInsets.only(
        top: reSize(context, 8),
        bottom: reSize(context, 8),
        left: reSize(context, 16),
        right: reSize(context, 16),
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: darkBG ? NEUTRAL_WHITE : NEUTRAL_BLACK,
        ),
      ),
    ),
  );
}
