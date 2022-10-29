import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding/onboarding.dart';

PageModel pageOne() {
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 45.0,
              vertical: 90.0,
            ),
            child: Stack(children: [
              SvgPicture.asset(
                'assets/obBoarding/Tracking & Maps.svg',
                fit: BoxFit.cover,
              ),
            ]),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Nearby restaurants',
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
                "You don't have to go far to find a good restaurant\n we have provided all the restaurants that is \nnear you",
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
           const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 30.0,
            ),
          ),
        ],
      ),
    ),
  );
}
