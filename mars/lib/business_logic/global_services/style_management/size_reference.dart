import 'package:flutter/material.dart';
import 'package:mars/interface/style_guide/device_constants.dart';
import 'package:mars/interface/style_guide/reference_sizes_guide.dart';

double reSize(BuildContext context, double size) {
  double newSize;
  newSize = (size * deviceWidth(context)) / REFERENCE_WIDTH;
  return newSize;
}
