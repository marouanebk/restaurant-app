import 'package:flutter/material.dart';
import 'package:restaurent_app/authentication/forgot%20password/presentation/screens/new_password.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: Color(AppColors.mainGreen),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(AppColors.mainGreen),
                  width: 3,
                ),
              ),
              child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.check,
                    size: 55.0,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Success',
              style: TextStyle(
                fontSize: 24.0,
                wordSpacing: 1,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Please check your email for create\na new password',
              style: TextStyle(
                fontSize: 16.0,
                wordSpacing: 1,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w400,
                color: Color(0xFF6B7280),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 26,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.7,
                  height: 1.5,
                ),
                children: <TextSpan>[
                  const TextSpan(text: "Can't get email?"),
                  TextSpan(
                      text: ' Resubmit',
                      style: TextStyle(color: Color(AppColors.mainGreen))),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 60,
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const NewPasswordScreen()),
                      (Route<dynamic> route) => false);
                },
                child: Container(
                  height: 49,
                  // padding: EdgeInsets.symmetric(vertical: 60),
                  decoration: BoxDecoration(
                    color: Color(AppColors.mainGreen),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: const Center(
                    child: Text(
                      'Back Email',
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
            ),
          ],
        ),
      ),
    ));
  }
}
