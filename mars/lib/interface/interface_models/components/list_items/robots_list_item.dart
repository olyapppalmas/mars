import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/style_management/get_robot_type_image.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';
import 'package:mars/interface/interface_models/single_elements/image_display/small_profile_picture.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';
import 'package:mars/interface/interface_models/type/type_models.dart';

Widget robotListItem(
  BuildContext context,
  String type,
  bool isLost,
  String robotName,
  int robotIndex,
  bool hasShadow,
  Widget trailingButton,
) {
  return robotListItemContent(
    context,
    type,
    isLost,
    robotName,
    robotIndex,
    hasShadow,
    trailingButton,
  );
}

Widget robotListItemNavigation(
  BuildContext context,
  String type,
  bool isLost,
  String robotName,
  int robotIndex,
  bool hasShadow,
  Function navigation,
  Widget trailingButton,
) {
  return InkWell(
    onTap: () {
      navigation();
    },
    child: robotListItemContent(
      context,
      type,
      isLost,
      robotName,
      robotIndex,
      hasShadow,
      trailingButton,
    ),
  );
}

Widget robotListItemContent(
  BuildContext context,
  String type,
  bool isLost,
  String robotName,
  int robotIndex,
  bool hasShadow,
  Widget trailingButton,
) {
  return Container(
    margin: EdgeInsets.only(
      top: robotIndex == 0 ? reSize(context, 24) : 0,
      bottom: reSize(context, 24),
      right: reSize(context, 16),
      left: reSize(context, 16),
    ),
    padding: EdgeInsets.all(
      reSize(context, 16),
    ),
    decoration: BoxDecoration(
      color: hasShadow ? NEUTRAL_WHITE : Colors.transparent,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.05),
          spreadRadius: 8,
          blurRadius: 7,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: ListTile(
      leading:
          smallProfilePicture(context, returnRobotTypeImageUrl(type), isLost),
      title: typeLabelColorChange(
        context,
        isLost ? 'Lost' : 'Operational',
        isLost ? UNSELECTED_COLOR : FEEDBACK_POSITIVE_COLOR,
      ),
      subtitle: typeSubtitleColorChange(
        context,
        robotName,
        isLost ? UNSELECTED_COLOR : NEUTRAL_BLACK,
      ),
      trailing: trailingButton,
    ),
  );
}
