import 'package:flutter/material.dart';
import 'package:mars/interface/interface_models/components/page_display/appbar_display.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';

class CreateRobotPage extends StatefulWidget {
  const CreateRobotPage({Key? key}) : super(key: key);

  @override
  _CreateRobotPageState createState() => _CreateRobotPageState();
}

class _CreateRobotPageState extends State<CreateRobotPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        appBar: CustomAppBar('Create Robot'),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
