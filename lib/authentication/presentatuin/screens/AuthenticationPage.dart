import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';

class Authenticationpage extends StatelessWidget {
  const Authenticationpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
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
            const Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45.0,
                vertical: 40.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45.0,
                vertical: 50.0,
              ),
              child: Stack(children: [
                SvgPicture.asset(
                  'assets/authentication/Order Success.svg',
                  fit: BoxFit.cover,
                ),
              ]),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Welcome',
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
                  "Before enjoying Foodmedia services\n Please register first",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 0.7,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45.0,
                vertical: 15.0,
              ),
            ),
            TextButton(
              onPressed: () {
                showMaterialModalBottomSheet(
                  context: context,
                  builder: (context) =>
                      // {
                      //   return DraggableScrollableSheet(
                      //     initialChildSize: 0.6,
                      //     minChildSize: 0.2,
                      //     maxChildSize: 0.85,
                      //     builder: (_, controller) {
                      //       return Container();
                      //     },
                      //   );

                      Container(
                    height: MediaQuery.of(context).size.width * 1.3,
                    child: Text("hello world"),
                  ),
                );
              },
              child: Container(
                height: 49,
                width: 256,
                decoration: BoxDecoration(
                    color: Color(AppColors.mainGreen),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    border: Border.all(color: Colors.blueAccent)),
                child: Center(
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 14.0,
                      wordSpacing: 1,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                height: 49,
                width: 256,
                decoration: BoxDecoration(
                    color: Color(AppColors.openGreen),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    border: Border.all(color: Colors.blueAccent)),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 14.0,
                      wordSpacing: 1,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w500,
                      color: Color(AppColors.mainGreen),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  // Note: Styles for TextSpans must be explicitly defined.

                  // Child text spans will inherit styles from parent

                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 0.7,
                    height: 1.5,
                  ),

                  children: <TextSpan>[
                    const TextSpan(
                        text:
                            'By logging in or registering, you have agreed to '),
                    TextSpan(
                        text: 'the Terms and \nConditions ',
                        style: TextStyle(color: Color(AppColors.mainGreen))),
                    TextSpan(text: 'And '),
                    TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(color: Color(AppColors.mainGreen))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
