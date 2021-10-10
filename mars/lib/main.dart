import 'package:flutter/material.dart';
import 'package:mars/business_logic/global_services/app_state.dart';
import 'package:mars/business_logic/services/earth/commands/commands_provider.dart';
import 'package:mars/business_logic/services/mars/mars_panel/mars_panel_provider.dart';
import 'package:mars/business_logic/services/mars/scents/scents_provider.dart';
import 'package:mars/business_logic/services/mars/robots/robots_provider.dart';
import 'package:mars/interface/style_guide/colors_guide.dart';
import 'package:provider/provider.dart';
import 'interface/pages/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StateController(),
        ),
        ChangeNotifierProvider(
          create: (_) => CommandProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MarsPanelController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScentsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RobotsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mars',
        theme: ThemeData(
          backgroundColor: NEUTRAL_WHITE,
          primarySwatch: Colors.blue,
          accentColor: NEUTRAL_BLACK,
          hintColor: Colors.black,
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: NEUTRAL_BLACK,
            cursorColor: NEUTRAL_BLACK,
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
