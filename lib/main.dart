import 'package:flutter/material.dart';
import './screens/start_page.dart';
import 'package:flutter/services.dart';
import './theme/theme.dart';


void main() {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(App());
  }

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: appTheme,
      title: 'App Concept',
      home: StartPage(),
    );
  }
}


