import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/style_management/size_reference.dart';
import 'package:mars/interface/interface_models/single_elements/buttons/tertiary_button.dart';
import 'package:mars/interface/pages/home/home_page.dart';
import 'package:mars/interface/style_guide/device_constants.dart';
import 'package:mars/interface/style_guide/image_urls.dart';
import 'package:mars/interface/interface_models/type/type_models.dart';
import 'package:mars/interface/style_guide/space_models.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            bottom: reSize(context, 48),
            left: reSize(context, 48),
          ),
          width: deviceWidth(context),
          height: deviceHeight(context),
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(WELCOMEBG),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              typeHeading2(context, 'Welcome back,'),
              typeHeading2(context, 'Commander!'),
              space(context, 16),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    ModalRoute.withName("/Home"),
                  );
                },
                child: tertiaryButton(
                  context,
                  true,
                  'Start',
                  () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
