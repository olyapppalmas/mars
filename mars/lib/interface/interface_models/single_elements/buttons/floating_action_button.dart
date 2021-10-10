import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';
import 'package:mars/interface/interface_models/single_elements/icons/single_icons.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';

Widget floatingActionButton(
  BuildContext context,
  Function function,
) {
  return SizedBox(
    width: reSize(context, 72),
    height: reSize(context, 72),
    child: FloatingActionButton(
      onPressed: function(),
      child: icon(
        context,
        Icons.add,
        NEUTRAL_WHITE,
      ),
    ),
  );
}
