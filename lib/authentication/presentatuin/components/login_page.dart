import 'package:flutter/material.dart';
import 'package:restaurent_app/authentication/forgot%20password/presentation/screens/forgot_password.dart';
import 'package:restaurent_app/authentication/presentatuin/components/create_account.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';
import 'package:restaurent_app/core/widgets/text_field_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
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
                        child: CreateAccountPage()),
                  ),
                );
              },
              child: Container(
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 16.0,
                    wordSpacing: 1,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w600,
                    color: Color(AppColors.grey),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: Color(AppColors.mainGreen),
                  ),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 16.0,
                  wordSpacing: 1,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                  color: Color(AppColors.mainGreen),
                  textBaseline: TextBaseline.alphabetic,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
        Text(
          '  Email Adress',
          style: TextStyle(
            fontSize: 16.0,
            wordSpacing: 1,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w600,
            color: Color(email.toString().isEmpty
                ? AppColors.belowBlack
                : AppColors.textController),
          ),
          textAlign: TextAlign.start,
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        Container(
          height: 49,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: Color(0xFFBEC5D1)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 1),
            child: TextFieldInput(
                hintText: 'Eg namaemail@emailkamu.com',
                textEditingController: email,
                textInputType: TextInputType.text),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 15)),
        Text(
          '  Password',
          style: TextStyle(
            fontSize: 16.0,
            wordSpacing: 1,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w600,
            color: Color(password.toString().isEmpty
                ? AppColors.belowBlack
                : AppColors.textController),
          ),
          textAlign: TextAlign.start,
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        Container(
          height: 49,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: Color(0xFFBEC5D1)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 1),
            child: TextFieldInput(
              hintText: '********',
              textEditingController: password,
              textInputType: TextInputType.text,
              isPass: true,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            clipBehavior: Clip.none,
            onPressed: () {
              // Navigator.of(context).pop();
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (_) => ForgotPasswordScreen(),
                ),
              );
            },
            child: Text(
              'forgot password?',
              style: TextStyle(
                  fontSize: 16.0,
                  wordSpacing: 1,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                  color: Color(AppColors.mainGreen)),
              textAlign: TextAlign.end,
            ),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        SizedBox(
          height: 10,
        ),
        // Container(
        //   height: 49,
        //   width: double.infinity,
        //   child: Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 1),
        //   ),
        // ),
        SizedBox(
          height: 28,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: TextButton(
            onPressed: () {},
            child: Container(
              height: 49,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF4F4F4),
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
                    color: Color(AppColors.textController),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: TextButton(
            onPressed: () {},
            child: Container(
              height: 49,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF4F4F4),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      // color: MainGreen,
                      image: DecorationImage(
                        image: AssetImage('assets/icons/ic_google.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Login with Google ',
                    style: TextStyle(
                      fontSize: 14.0,
                      wordSpacing: 1,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF222222),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
