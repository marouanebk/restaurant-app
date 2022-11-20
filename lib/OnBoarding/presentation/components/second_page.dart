import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding/onboarding.dart';

PageModel pageTwo() {
  return PageModel(
    widget: DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 0.0,
          color: Colors.white,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(
            flex: 1,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 45.0,
            ),
            child: Stack(children: [
              SvgPicture.asset(
                'assets/obBoarding/Order illustration.svg',
                fit: BoxFit.cover,
              ),
            ]),
          ),
          const Spacer(
            flex: 1,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Select the Favorites Menu',
                style: TextStyle(
                  fontSize: 24.0,
                  wordSpacing: 1,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Now eat well, don't leave the house,You can\nchoose your favorite food only with \none click",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.7,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Spacer(flex: 1,),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15.0,
            ),
          ),
        ],
      ),
    ),
  );
}
