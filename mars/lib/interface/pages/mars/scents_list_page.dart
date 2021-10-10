import 'package:flutter/material.dart';
import 'package:mars/business_logic/services/mars/scents/scents_provider.dart';
import 'package:mars/business_logic/services/mars/robots/robots_provider.dart';
import 'package:mars/interface/interface_models/components/list_items/scent_list_item.dart';
import 'package:mars/interface/interface_models/components/page_display/appbar_display.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';
import 'package:provider/provider.dart';

class ScentListPage extends StatefulWidget {
  const ScentListPage({Key? key}) : super(key: key);

  @override
  _ScentListPageState createState() => _ScentListPageState();
}

class _ScentListPageState extends State<ScentListPage> {
  @override
  Widget build(BuildContext context) {
    final scentsProvider = context.watch<ScentsProvider>();
    final robotsProvider = context.watch<RobotsProvider>();
    final scentsList = scentsProvider.scentsList;

    return SafeArea(
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        appBar: CustomAppBar('Scents'),
        body: ListView.builder(
          itemCount: scentsList.length,
          itemBuilder: (context, scentIndex) {
            final String scentPosition = scentsList[scentIndex].scentPosition;
            final int robotIndex = scentsList[scentIndex].robotIndex;
            final String robotName =
                robotsProvider.robotsList[robotIndex].robotName;
            final List<String> splitPosition = scentPosition.split(' ');
            final String xPosition = splitPosition[0];
            final String yPosition = splitPosition[1];

            return scentListItem(
              context,
              int.parse(xPosition),
              int.parse(yPosition),
              robotName,
              scentIndex,
            );
          },
        ),
      ),
    );
  }
}
