import 'package:flutter/material.dart';
import 'package:mars/business_logic/services/mars/mars_panel/mars_panel_provider.dart';
import 'package:mars/interface/interface_models/components/page_display/appbar_display.dart';
import 'package:mars/interface/interface_models/single_elements/dividers/full_width_divider.dart';
import 'package:mars/interface/interface_models/type/type_models.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';
import 'package:mars/interface/style_guide/space_models.dart';
import 'package:provider/provider.dart';

class MarsPanelPage extends StatefulWidget {
  const MarsPanelPage({Key? key}) : super(key: key);

  @override
  _MarsPanelPageState createState() => _MarsPanelPageState();
}

class _MarsPanelPageState extends State<MarsPanelPage> {
  @override
  Widget build(BuildContext context) {
    final marsPanelController = context.watch<MarsPanelController>();
    final panelUpdates = marsPanelController.panelUpdates;

    return SafeArea(
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        appBar: CustomAppBar('Mars Panel'),
        body: ListView.builder(
          itemCount: panelUpdates.length,
          itemBuilder: (context, index) {
            final String updateString = panelUpdates[index].updateString;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                space(context, 24),
                Center(child: typeLabel(context, updateString)),
                space(context, 24),
                divider(context),
              ],
            );
          },
        ),
      ),
    );
  }
}
