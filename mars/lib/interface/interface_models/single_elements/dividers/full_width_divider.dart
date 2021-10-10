import 'package:flutter/material.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';
import 'package:mars/interface/style_guide/device_constants.dart';

Widget divider(BuildContext context) {
  return Container(
    color: ACCENT_COLOR,
    width: deviceWidth(context),
    height: 2,
  );
}
