
import 'package:flutter/material.dart';
import 'package:idchecktrue/app/screens/onboarding/onboarding.dart';
//import 'package:idchecktrue/app/screens/Welcome/welcome_screen.dart';
import 'package:idchecktrue/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ID CHECK',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Onboarding(),
      debugShowCheckedModeBanner: false,
    );
  }
}

