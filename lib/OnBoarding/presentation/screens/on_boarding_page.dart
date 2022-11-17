import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:restaurent_app/OnBoarding/presentation/components/first_page.dart';
import 'package:restaurent_app/OnBoarding/presentation/components/second_page.dart';
import 'package:restaurent_app/OnBoarding/presentation/components/third_page.dart';
import 'package:restaurent_app/authentication/presentation/screens/AuthenticationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late Material materialButton;
  late int index;

  final onboardingPagesList = [
    //first page
    pageOne(),
    //second page
    pageTwo(),
    //3rd page
    pageThree(),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      child: InkWell(
        onTap: () async {
          if (setIndex != null) {
            if (index == 2) {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setInt("onBoarding", 1);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Authenticationpage()));
            }
            index = index + 1;
            setIndex(index);
          }
        },
        child: const Padding(
            padding: defaultSkipButtonPadding,
            child: Icon(
              Icons.arrow_forward_sharp,
              color: Color(0xFF32B768),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    index == pagesLength - 1
                        ? const Text(
                            "Skip",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 0.7,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          )
                        : GestureDetector(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setInt("onBoarding", 1);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const Authenticationpage()));
                            },
                            child: Container(
                              child: const Text(
                                "Skip",
                                style: TextStyle(
                                  color: Color(0xFF4B5563),
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 0.7,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                    CustomIndicator(
                      shouldPaint: true,
                      netDragPercent: dragDistance,
                      pagesLength: pagesLength,
                      indicator: Indicator(
                        activeIndicator: const ActiveIndicator(
                            color: Colors.white, borderWidth: 0.7),
                        closedIndicator: const ClosedIndicator(
                            color: Color(0xFF32B768), borderWidth: 0.7),
                        indicatorDesign: IndicatorDesign.polygon(
                          polygonDesign: PolygonDesign(
                            polygon: DesignType.polygon_circle,
                          ),
                        ),
                      ),
                    ),
                    _skipButton(setIndex: setIndex)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
