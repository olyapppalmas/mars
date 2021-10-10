import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';
import 'package:mars/interface/style_guide/type_guide.dart';

// Models for text:

//Heading 1
Widget typeHeading1(
  final BuildContext context,
  final String text,
) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.getFont(
      MAIN_FONT,
      fontSize: reSize(context, HEADING_1_SIZE),
      fontWeight: FontWeight.bold,
      color: NEUTRAL_BLACK,
    ),
  );
}

//Heading 2
Widget typeHeading2(
  final BuildContext context,
  final String text,
) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.getFont(
      MAIN_FONT,
      height: 1.1,
      fontSize: reSize(context, HEADING_2_SIZE),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      color: NEUTRAL_WHITE,
    ),
  );
}

//Heading 3
Widget typeHeading3(
  final BuildContext context,
  final String text,
) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.getFont(
      MAIN_FONT,
      fontSize: reSize(context, HEADING_3_SIZE),
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      color: NEUTRAL_BLACK,
    ),
  );
}

//Body
Widget typeBody(
  final BuildContext context,
  final String text,
) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.getFont(
      MAIN_FONT,
      fontSize: reSize(context, BODY_SIZE),
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      color: NEUTRAL_BLACK,
    ),
  );
}

//Subtitle
Widget typeSubtitle(
  final BuildContext context,
  final String text,
) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.getFont(
      MAIN_FONT,
      fontSize: reSize(context, SUBTITLE_SIZE),
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      color: NEUTRAL_BLACK,
    ),
  );
}

//Subtitle
Widget typeSubtitleColorChange(
  final BuildContext context,
  final String text,
  final Color color,
) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.getFont(
      MAIN_FONT,
      fontSize: reSize(context, SUBTITLE_SIZE),
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      color: color,
    ),
  );
}

//Label
Widget typeLabel(
  final BuildContext context,
  final String text,
) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.getFont(
      MAIN_FONT,
      fontSize: reSize(context, LABLE_SIZE),
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      color: NEUTRAL_BLACK,
    ),
  );
}

//Label
Widget typeLabelColorChange(
  final BuildContext context,
  final String text,
  final Color color,
) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.getFont(
      MAIN_FONT,
      fontSize: reSize(context, LABLE_SIZE),
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      color: color,
    ),
  );
}

//Small Label
Widget typeSmallLabel(
  final BuildContext context,
  final String text,
) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.getFont(
      MAIN_FONT,
      fontSize: reSize(context, SMALL_LABEL_SIZE),
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      color: NEUTRAL_BLACK,
    ),
  );
}
