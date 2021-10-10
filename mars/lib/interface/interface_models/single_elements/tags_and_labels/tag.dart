import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';
import 'package:mars/interface/interface_models/single_elements/icons/single_icons.dart';
import 'package:mars/interface/interface_models/type/type_models.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';

Widget tag(
  BuildContext context,
  bool isSelected,
  String label,
  bool hasIcon,
) {
  return Container(
    width: reSize(context, 80),
    height: reSize(context, 40),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        hasIcon
            ? icon(
                context,
                Icons.add,
                isSelected ? Colors.black54 : SECONDARY_TEXT_COLOR,
              )
            : Container(),
        typeLabelColorChange(
          context,
          label,
          Colors.black54,
        ),
      ],
    ),
    padding: EdgeInsets.all(
      reSize(context, 4),
    ),
    decoration: BoxDecoration(
      color: Colors.transparent,
      border: Border.all(
        color: isSelected ? Colors.black45 : ACCENT_COLOR,
      ),
    ),
  );
}
