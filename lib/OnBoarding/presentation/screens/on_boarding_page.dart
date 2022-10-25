import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:onboarding/onboarding.dart';
import 'package:restaurent_app/authentication/presentatuin/screens/AuthenticationPage.dart';

class onBoardingPage extends StatefulWidget {
  const onBoardingPage({Key? key}) : super(key: key);

  @override
  State<onBoardingPage> createState() => _onBoardingPageState();
}

class _onBoardingPageState extends State<onBoardingPage> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    //first page
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              const Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 70.0,
                ),
              ),
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
                  alignment: Alignment.centerLeft,
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
            ],
          ),
        ),
      ),
    ),
    //second page
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              const Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 70.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 90.0,
                ),
                child: Stack(children: [
                  SvgPicture.asset(
                    'assets/obBoarding/Order illustration.svg',
                    fit: BoxFit.cover,
                  ),
                ]),
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
                  alignment: Alignment.centerLeft,
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
            ],
          ),
        ),
      ),
    ),
    //3rd page
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              const Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 70.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 90.0,
                ),
                child: SvgPicture.asset(
                  'assets/obBoarding/Safe Food.svg',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Good food at a cheap price',
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
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You can eat at expensive restaurants with\naffordable price",
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
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      // borderRadius: defaultSkipButtonBorderRadius,
      // color: defaultSkipButtonColor,
      child: InkWell(
        // borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            if (index == 2) {
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

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {},
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Sign up',
            style: defaultProceedButtonTextStyle,
          ),
        ),
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
            return
                // DecoratedBox(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     // border: Border.all(
                //     //   width: 0.0,
                //     //   color: background,
                //     // ),
                //   ),
                //   child:
                ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    index == pagesLength - 1
                        ? Container()
                        : const Text(
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
                    // index == pagesLength - 1
                    //     ? _signupButton
                    //     :

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
