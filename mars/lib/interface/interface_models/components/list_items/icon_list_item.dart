import 'package:flutter/material.dart';
import 'package:mars/interface/interface_models/single_elements/icons/circled_icon.dart';
import 'package:mars/interface/interface_models/single_elements/icons/single_icons.dart';
import 'package:mars/interface/interface_models/type/type_models.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';

Widget iconListItem(
  BuildContext context,
  IconData iconData,
  String text,
  String trailingText,
  bool isTrailingIcon,
) {
  return iconItemContent(
    context,
    iconData,
    text,
    trailingText,
    isTrailingIcon,
  );
}

Widget iconListItemNavigation(
  BuildContext context,
  IconData iconData,
  String text,
  String trailingText,
  bool isTrailingIcon,
  Function navigation,
) {
  return InkWell(
    onTap: () {
      navigation();
    },
    child: iconItemContent(
      context,
      iconData,
      text,
      trailingText,
      isTrailingIcon,
    ),
  );
}

Widget iconItemContent(
  BuildContext context,
  IconData iconData,
  String text,
  String trailingText,
  bool isTrailingIcon,
) {
  return ListTile(
    leading: circledIcon(context, iconData),
    title: typeLabel(context, text),
    trailing: isTrailingIcon
        ? icon(context, Icons.chevron_right, NEUTRAL_BLACK)
        : typeBody(context, trailingText),
  );
}
