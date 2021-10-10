import 'package:flutter/material.dart';
import 'package:mars/interface/interface_models/type/type_models.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String text;
  const CustomAppBar(
    this.text,
  );
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: NEUTRAL_BLACK,
      ),
      foregroundColor: NEUTRAL_BLACK,
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: typeBody(context, text),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
