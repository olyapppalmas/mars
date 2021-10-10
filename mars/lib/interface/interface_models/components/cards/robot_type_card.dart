import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/style_management/get_robot_type_image.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';
import 'package:mars/interface/interface_models/single_elements/image_display/small_profile_picture.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';
import 'package:mars/interface/style_guide/space_models.dart';
import 'package:mars/interface/interface_models/type/type_models.dart';

Widget robotTypeCard(
  BuildContext context,
  bool isSelected,
  String type,
  String label,
) {
  return Container(
    width: reSize(context, 124),
    height: reSize(context, 160),
    margin: EdgeInsets.only(
      top: reSize(context, 24),
      bottom: reSize(context, 24),
      right: reSize(context, 0),
      left: reSize(context, 16),
    ),
    padding: EdgeInsets.all(
      reSize(context, 16),
    ),
    decoration: BoxDecoration(
      border: Border.all(color: isSelected ? UNSELECTED_COLOR : ACCENT_COLOR),
      color: NEUTRAL_WHITE,
      boxShadow: [
        BoxShadow(
          color:
              isSelected ? Colors.grey.withOpacity(0.05) : Colors.transparent,
          spreadRadius: 8,
          blurRadius: 7,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        smallProfilePicture(context, returnRobotTypeImageUrl(type), false),
        space(context, 16),
        typeLabel(context, label),
      ],
    ),
  );
}
