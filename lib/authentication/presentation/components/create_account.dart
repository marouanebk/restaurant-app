import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurent_app/authentication/domaine/Entities/user.dart';
import 'package:restaurent_app/authentication/presentation/bloc/user_bloc_bloc.dart';
import 'package:restaurent_app/authentication/presentation/bloc/user_bloc_event.dart';
import 'package:restaurent_app/authentication/presentation/components/login_page.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';
import 'package:restaurent_app/core/widgets/text_field_input.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  @override
  void initState() {
    super.initState();
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
            singupText(),
            navigationButton(context),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        controllerLabel("Full Name", _fullname),
        // fullname_text(fullname),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        textController("Enter Your full name", _fullname, false),
        const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
        controllerLabel("Email Adress", _email),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        textController("Eg namaemail@emailkamu.com", _email, false),
        const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
        controllerLabel("Password", _pass),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        textController("********", _pass, true),
        const SizedBox(
          height: 30,
        ),
        registrationButton(),
        registerGoogle(),
      ],
    );
  }

  Widget registrationButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: TextButton(
        onPressed: () {},
        child: Container(
          height: 49,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFFF4F4F4),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Center(
            child: Text(
              'Registration',
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
    );
  }

  // void createAccount() {
  //   final user = User(
  //     fullname: _fullname.text,
  //     email: _email.text,
  //     password: _pass.text,
  //   );

  //   BlocProvider.of<UserBlocBloc>(context).add(CreateUserEvent(user: user));
  // }
}

Widget navigationButton(context) {
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
              child: LoginPage()
              // child: Column(children: [Text("helo")]),
              ),
        ),
      );
    },
    child: Container(
      child: Text(
        'Login',
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

Widget singupText() {
  return Container(
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
      'Create Account',
      style: TextStyle(
        fontSize: 16.0,
        wordSpacing: 1,
        letterSpacing: 1.2,
        fontWeight: FontWeight.w600,
        color: Color(AppColors.mainGreen),
        textBaseline: TextBaseline.alphabetic,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget controllerLabel(String label, TextEditingController controller) {
  return Text(
    '  ${label}',
    style: TextStyle(
      fontSize: 16.0,
      wordSpacing: 1,
      letterSpacing: 1.2,
      fontWeight: FontWeight.w600,
      color: Color(controller.toString().isEmpty
          ? AppColors.belowBlack
          : AppColors.textController),
    ),
    textAlign: TextAlign.start,
  );
}

Widget textController(String hint, TextEditingController controller, type) {
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
      ),
    ),
  );
}

Widget registerGoogle() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: TextButton(
      onPressed: () {},
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
              'Register with Google ',
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
