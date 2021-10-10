import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/readability/readable_instruction_label.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';
import 'package:mars/interface/interface_models/single_elements/tags_and_labels/tag.dart';
//import 'package:mars/interface/interface_models/single_elements/icons/single_icons.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';
import 'package:mars/interface/interface_models/type/type_models.dart';
import 'package:mars/interface/style_guide/device_constants.dart';
import 'package:mars/interface/style_guide/space_models.dart';

Widget commandListItem(
  BuildContext context,
  int commandLineIndex,
  String commandLine,
) {
  List instructionsList = commandLine.split('');
  return Container(
    margin: EdgeInsets.only(
      top: commandLineIndex == 0 ? reSize(context, 24) : 0,
      bottom: reSize(context, 24),
      right: reSize(context, 16),
      left: reSize(context, 16),
    ),
    padding: EdgeInsets.all(
      reSize(context, 16),
    ),
    decoration: BoxDecoration(
      color: NEUTRAL_WHITE,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.05),
          spreadRadius: 8,
          blurRadius: 7,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: typeLabel(
                context,
                'Command Line: ' + commandLineIndex.toString(),
              ),
            ),
            //icon(context, Icons.delete_outline, NEUTRAL_BLACK),
          ],
        ),
        space(context, 16),
        Container(
          width: deviceWidth(context),
          height: reSize(context, 40),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: instructionsList.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  tag(
                    context,
                    false,
                    readableInstrctionLabel(instructionsList[index]),
                    false,
                  ),
                  spaceWidth(context, 8),
                ],
              );
            },
          ),
        )
      ],
    ),
  );
}
