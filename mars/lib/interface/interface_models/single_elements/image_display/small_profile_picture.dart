import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';

Widget smallProfilePicture(
  BuildContext context,
  String imageUrl,
  bool isLost,
) {
  return Container(
    width: reSize(context, 56),
    height: reSize(context, 56),
    foregroundDecoration: BoxDecoration(
      color: isLost ? Colors.grey : Colors.transparent,
      backgroundBlendMode: BlendMode.saturation,
    ),
    decoration: new BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: NetworkImage(imageUrl),
        fit: BoxFit.contain,
      ),
    ),
  );
}
