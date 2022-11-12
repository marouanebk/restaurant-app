import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurent_app/authentication/presentation/controller/bloc/user_bloc_bloc.dart';
import 'package:restaurent_app/authentication/presentation/components/create_account.dart';
import 'package:restaurent_app/authentication/presentation/components/login_page.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';
import 'package:restaurent_app/injection_container.dart';

class Authenticationpage extends StatefulWidget {
  const Authenticationpage({super.key});

  @override
  State<Authenticationpage> createState() => _AuthenticationpageState();
}

class _AuthenticationpageState extends State<Authenticationpage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<UserBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 45.0,
                  ),
                  child: Stack(children: [
                    SvgPicture.asset(
                      'assets/authentication/Order Success.svg',
                      fit: BoxFit.cover,
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                welcome_padding(),
                register_padding(),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 45.0,
                    vertical: 15.0,
                  ),
                ),
                signup_button(context),
                login_botton(context),
                footer(),
              ],
            )),
      ),
    );
  }
}

Widget welcome_padding() {
  return const Padding(
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
  );
}

Widget register_padding() {
  return const Padding(
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
  );
}

Widget signup_button(context) {
  return TextButton(
    onPressed: () {
      showModalBottomSheet<dynamic>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom * 0.5),
          child: Container(
            height: 576,

            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36), topRight: Radius.circular(36)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: 40,
              ),

              child: const CreateAccountPage(),
            ),
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
  );
}

Widget login_botton(context) {
  return TextButton(
    onPressed: () {
      showModalBottomSheet<dynamic>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom * 0.5),
          child: Container(
            height: 576,

            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36), topRight: Radius.circular(36)),
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: 40),
                child: const LoginPage()
                ),
          ),
        ),
      );
    },
    child: Container(
      height: 49,
      width: 256,
      decoration: BoxDecoration(
        color: Color(AppColors.openGreen),
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
            color: Color(AppColors.mainGreen),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

Widget footer() {
  return Padding(
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
              text: 'By logging in or registering, you have agreed to '),
          TextSpan(
              text: 'the Terms and \nConditions ',
              style: TextStyle(color: Color(AppColors.mainGreen))),
          const TextSpan(text: 'And '),
          TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(color: Color(AppColors.mainGreen))),
        ],
      ),
    ),
  );
}
