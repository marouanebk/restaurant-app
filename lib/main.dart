import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurent_app/OnBoarding/presentation/screens/on_boarding_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restaurent_app/authentication/presentation/controller/bloc/user_bloc_bloc.dart';
import 'package:restaurent_app/authentication/presentation/controller/bloc/user_bloc_event.dart';
import 'package:restaurent_app/authentication/presentation/controller/bloc/user_bloc_state.dart';
import 'package:restaurent_app/authentication/presentation/screens/AuthenticationPage.dart';
import 'package:restaurent_app/injection_container.dart';
import 'package:restaurent_app/mainpage/presentation/screens/base_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
void main() async {
  await ServiceLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("onBoarding");
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
      debugShowCheckedModeBanner: false,
      home: (initScreen == 1)
          ? StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return const BaseScreen();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  }
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return const Authenticationpage();
              },
            )
          : const OnBoardingPage(),

      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.active) {
      //       if (snapshot.hasData) {
      //         return const BaseScreen();
      //       } else if (snapshot.hasError) {
      //         return Center(
      //           child: Text('${snapshot.error}'),
      //         );
      //       }
      //     }
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     return const Authenticationpage();
      //   },
      // ),
    );
  }
}
