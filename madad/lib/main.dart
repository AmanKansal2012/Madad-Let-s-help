
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madad/utils/constants.dart';
import 'views/landing_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: kColorB, // navigation bar color
    statusBarColor: kColorA, // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "मदद -Let's help each other",

        home:LandingScreen()
    );
  }
}


