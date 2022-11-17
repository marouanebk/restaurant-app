import 'package:flutter/material.dart';
import 'package:restaurent_app/OnBoarding/presentation/screens/on_boarding_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restaurent_app/authentication/presentation/screens/AuthenticationPage.dart';
import 'package:restaurent_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
void main() async {
  await ServiceLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // initScreen = prefs.getInt("onBoarding");
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
      // home: initScreen != 0 ? const OnBoardingPage() : const Authenticationpage(),
      home: const Authenticationpage(),
    );
  }
}
