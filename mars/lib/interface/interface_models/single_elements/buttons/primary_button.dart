import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';
import 'package:mars/interface/interface_models/single_elements/icons/single_icons.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';
import 'package:mars/interface/style_guide/device_constants.dart';
import 'package:mars/interface/interface_models/type/type_models.dart';
import 'package:mars/interface/style_guide/space_models.dart';

Widget primaryButton(
  BuildContext context,
  bool hasIcon,
  String label,
  Function function,
) {
  return GestureDetector(
    onTap: function(),
    child: Container(
      width: deviceWidth(context),
      height: reSize(context, 56),
      margin: EdgeInsets.only(
        top: reSize(context, 0),
        bottom: reSize(context, 24),
        right: reSize(context, 16),
        left: reSize(context, 16),
      ),
      padding: EdgeInsets.all(
        reSize(context, 0),
      ),
      decoration: BoxDecoration(
        color: NEUTRAL_BLACK,
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hasIcon
                ? icon(
                    context,
                    Icons.add,
                    NEUTRAL_WHITE,
                  )
                : Container(),
            spaceWidth(context, reSize(context, 16)),
            typeSubtitleColorChange(context, label, NEUTRAL_WHITE),
          ],
        ),
      ),
    ),
  );
}
