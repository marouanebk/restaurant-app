import 'package:flutter/material.dart';
import 'package:restaurent_app/OnBoarding/presentation/screens/on_boarding_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:restaurent_app/authentication/presentation/components/create_account.dart';
import 'package:restaurent_app/authentication/presentation/screens/AuthenticationPage.dart';
import 'package:restaurent_app/injection_container.dart';
import 'firebase_options.dart';

void main() async {

  await ServiceLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      // home: const Authenticationpage(),

      // home:  MapSample(),
    );
  }
}
