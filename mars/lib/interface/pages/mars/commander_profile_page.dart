import 'package:flutter/material.dart';
import 'package:mars/business_logic/services/mars/mars_panel/mars_panel_provider.dart';
import 'package:mars/business_logic/services/mars/robots/robots_provider.dart';
import 'package:mars/interface/interface_models/components/cards/content_list_card.dart';
import 'package:mars/interface/interface_models/single_elements/dividers/full_width_divider.dart';
import 'package:mars/interface/interface_models/single_elements/image_display/big_profile_picture.dart';
import 'package:mars/interface/interface_models/single_elements/image_display/profile_background_image.dart';
import 'package:mars/interface/interface_models/type/type_models.dart';
import 'package:mars/interface/pages/mars/mars_panel.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';
import 'package:mars/interface/style_guide/space_models.dart';
import 'package:provider/provider.dart';

class CommanderProfilePage extends StatefulWidget {
  const CommanderProfilePage({Key? key}) : super(key: key);

  @override
  _CommanderProfilePageState createState() => _CommanderProfilePageState();
}

class _CommanderProfilePageState extends State<CommanderProfilePage> {
  @override
  Widget build(BuildContext context) {
    final marsPanelController = context.watch<MarsPanelController>();
    final robotsProvider = context.watch<RobotsProvider>();
    final String latestUpdate = marsPanelController.latestUpdate;
    final int numberOfOperationalRobots =
        robotsProvider.numberOfOperationalRobots;
    final int numberOfLostRobots = robotsProvider.numberOfLostRobots;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              bgProfileImage(context),
              Column(
                children: [
                  space(context, 96),
                  bigProfilePicture(context),
                  space(context, 24),
                  Center(child: typeBody(context, 'Jordan Evans')),
                  Center(
                    child: typeLabelColorChange(
                        context, 'Commander', SECONDARY_TEXT_COLOR),
                  ),
                  space(context, 24),
                  divider(context),
                  space(context, 24),
                  Center(child: typeLabel(context, 'Latest Update:')),
                  space(context, 4),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MarsPanelPage(),
                          ),
                        );
                      },
                      child:
                          Center(child: typeSubtitle(context, latestUpdate))),
                  space(context, 24),
                  divider(context),
                  space(context, 24),
                  contentListCard(
                    context,
                    numberOfOperationalRobots,
                    numberOfLostRobots,
                  ),
                  space(context, 24),
                  divider(context),
                  space(context, 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
