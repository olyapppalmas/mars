import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';
import 'package:mars/interface/style_guide/image_urls.dart';

Widget bgProfileImage(BuildContext context) {
  return Container(
    width: reSize(context, 411),
    height: reSize(context, 150),
    decoration: new BoxDecoration(
      shape: BoxShape.rectangle,
      image: DecorationImage(
        image: NetworkImage(PROFILE_BG_IMAGE),
        fit: BoxFit.contain,
      ),
    ),
  );
}
