import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:restaurent_app/OnBoarding/presentation/screens/on_boarding_page.dart';
import 'package:restaurent_app/mainpage/presentation/screens/base_screen.dart';
import 'package:restaurent_app/mainpage/presentation/screens/main_page.dart';

import 'mainpage/presentation/screens/map_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const onBoardingPage(),
      // home:  MapSample(),
    );
  }
}
