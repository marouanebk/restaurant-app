import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurent_app/authentication/presentatuin/components/create_account.dart';
import 'package:restaurent_app/authentication/presentatuin/components/login_page.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';

class Authenticationpage extends StatefulWidget {
  const Authenticationpage({super.key});

  @override
  State<Authenticationpage> createState() => _AuthenticationpageState();
}

class _AuthenticationpageState extends State<Authenticationpage> {
  TextEditingController email = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    fullname.dispose();
    password.dispose();
  }

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
                showModalBottomSheet<dynamic>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => Container(
                    // height: MediaQuery.of(context).size.height * 0.75,
                    height: 576,

                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36)),
                      // border: Border.all(color: Colors.blueAccent),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                          vertical: 40),
                      child: CreateAccountPage(fullname : fullname, email : email, pass : password),
                      // child: Column(children: [Text("helo")]),
                    ),
                  ),
                );
              },
              child: Container(
                height: 49,
                width: 256,
                decoration: BoxDecoration(
                  color: Color(AppColors.mainGreen),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: const Center(
                  child: Text(
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
              onPressed: () {
                showModalBottomSheet<dynamic>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => Container(
                    // height: MediaQuery.of(context).size.height * 0.75,
                    height: 576,

                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36)),
                      // border: Border.all(color: Colors.blueAccent),
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.1,
                            vertical: 40),
                        child: LoginPage()
                        // child: Column(children: [Text("helo")]),
                        ),
                  ),
                );
              },
              child: Container(
                height: 49,
                width: 256,
                decoration: BoxDecoration(
                  color: Color(AppColors.openGreen),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
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
