import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';
import 'package:mars/interface/interface_models/single_elements/tags_and_labels/tag.dart';
import 'package:mars/interface/interface_models/single_elements/icons/single_icons.dart';
import 'package:mars/interface/interface_models/type/type_models.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';

Widget contentListItem(
  BuildContext context,
  String tagLabel,
  String title,
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
    child: ListTile(
      leading: icon(context, Icons.chevron_right, NEUTRAL_BLACK),
      title: typeLabel(context, title),
      trailing: tag(context, false, tagLabel, false),
    ),
  );
}
