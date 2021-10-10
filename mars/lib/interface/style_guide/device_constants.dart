// Device information
import 'package:flutter/material.dart';

double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double devicePixelRatio(BuildContext context) =>
    MediaQuery.of(context).devicePixelRatio;
