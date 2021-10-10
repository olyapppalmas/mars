import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';

Widget space(BuildContext context, double space) {
  return SizedBox(
    height: reSize(context, space),
  );
}

Widget spaceWidth(BuildContext context, double space) {
  return SizedBox(
    width: reSize(context, space),
  );
}
