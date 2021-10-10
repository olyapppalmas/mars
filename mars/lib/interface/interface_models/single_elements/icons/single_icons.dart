import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';

Widget icon(BuildContext context, IconData icon, Color color) {
  return Icon(
    icon,
    size: reSize(context, 24),
    color: color,
  );
}
