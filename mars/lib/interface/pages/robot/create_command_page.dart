import 'package:flutter/material.dart';
import 'package:mars/interface/interface_models/components/page_display/appbar_display.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';

class CreateCommandPage extends StatefulWidget {
  const CreateCommandPage({Key? key}) : super(key: key);

  @override
  _CreateCommandPageState createState() => _CreateCommandPageState();
}

class _CreateCommandPageState extends State<CreateCommandPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        appBar: CustomAppBar('Create Command'),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
