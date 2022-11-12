import 'package:flutter/material.dart';

import 'package:restaurent_app/authentication/forgot%20password/presentation/screens/forgot_password.dart';
import 'package:restaurent_app/authentication/presentation/components/create_account.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';
import 'package:restaurent_app/core/widgets/text_field_input.dart';
import 'package:restaurent_app/mainpage/presentation/screens/base_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool emailColor = false;
  bool passwordColor = false;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            navigation_button(context),
            login_text(),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        controllerLabel(email, "Email Adress", emailColor),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        controller(email, 'Eg namaemail@emailkamu.com', false, 1),
        const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
        controllerLabel(password, "Password", passwordColor),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        controller(password, '**************', true, 2),
        const SizedBox(
          height: 5,
        ),
        forget_password(context),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        const SizedBox(
          height: 38,
        ),
        login_botton(context),
        login_google(context),
      ],
    );
  }

  Widget login_text() {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
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
          // decoration: TextDecoration.underline,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget navigation_button(context) {
    return InkWell(
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
                  topLeft: Radius.circular(36), topRight: Radius.circular(36)),
              // border: Border.all(color: Colors.blueAccent),
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: 40),
                child: const CreateAccountPage()),
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
    );
  }

  Widget controllerLabel(
      TextEditingController controller, String label, bool controllerColor) {
    return Text(
      '  ${label}',
      style: TextStyle(
        fontSize: 16.0,
        wordSpacing: 1,
        letterSpacing: 1.2,
        fontWeight: FontWeight.w600,
        color: Color(
            controllerColor ? AppColors.textController : AppColors.belowBlack),
      ),
      textAlign: TextAlign.start,
    );
  }

  Widget controller(TextEditingController controller, String hint, bool type,
      int controllerColor) {
    return Container(
      height: 49,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: const Color(0xFFBEC5D1)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 1),
        child: TextFieldInput(
          hintText: hint,
          textEditingController: controller,
          textInputType: TextInputType.text,
          isPass: type,
          onChangedFunc: (value) {
            if (controllerColor == 1) {
              if (email.text.isNotEmpty) {
                setState(() {
                  emailColor = true;
                });
              } else {
                setState(() {
                  emailColor = false;
                });
              }
            } else {
              if (password.text.isNotEmpty) {
                setState(() {
                  passwordColor = true;
                });
              } else {
                setState(() {
                  passwordColor = false;
                });
              }
            }
          },
        ),
      ),
    );
  }

  Widget forget_password(context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        clipBehavior: Clip.none,
        onPressed: () {
          // Navigator.of(context).pop();
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (_) => const ForgotPasswordScreen(),
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
    );
  }

  Widget login_botton(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const BaseScreen()),
              (Route<dynamic> route) => false);
        },
        child: Container(
          height: 49,
          width: double.infinity,
          decoration: BoxDecoration(
            color: (emailColor) && (passwordColor)
                ? const Color(0xFF32B768)
                : const Color(0xFFF4F4F4),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Center(
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 14.0,
                wordSpacing: 1,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w500,
                color: (emailColor) && (passwordColor)
                    ? Colors.white
                    : Color(AppColors.textController),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget login_google(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const BaseScreen()),
              (Route<dynamic> route) => false);
        },
        child: Container(
          height: 49,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFFF4F4F4),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  // color: MainGreen,
                  image: DecorationImage(
                    image: AssetImage('assets/icons/ic_google.png'),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
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
    );
  }
}
