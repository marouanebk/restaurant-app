import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24, top: 60),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(11.0),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
