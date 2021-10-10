import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';
import 'package:mars/interface/style_guide/image_urls.dart';

Widget bigProfilePicture(BuildContext context) {
  return Container(
    width: reSize(context, 96),
    height: reSize(context, 96),
    decoration: new BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: NetworkImage(BIG_PROFILE_PICTURE),
        fit: BoxFit.contain,
      ),
    ),
  );
}
