import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurent_app/authentication/domaine/Entities/user.dart';
import 'package:restaurent_app/authentication/forgot%20password/presentation/screens/forgot_password.dart';
import 'package:restaurent_app/authentication/presentation/components/create_account.dart';
import 'package:restaurent_app/authentication/presentation/controller/bloc/user_bloc_bloc.dart';
import 'package:restaurent_app/authentication/presentation/controller/bloc/user_bloc_event.dart';
import 'package:restaurent_app/authentication/presentation/controller/bloc/user_bloc_state.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';
import 'package:restaurent_app/core/widgets/text_field_input.dart';
import 'package:restaurent_app/injection_container.dart';
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
  String error = "";

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserBloc>(),
      child: Builder(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                navigationButton(context),
                loginText(),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
            controllerLabel(email, "  Email Adress", emailColor),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            controller(email, '  Eg namaemail@emailkamu.com', false, 1),
            const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            controllerLabel(password, "  Password", passwordColor),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            controller(password, '**************', true, 2),
            const SizedBox(
              height: 5,
            ),
            forgetPassword(context),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            BlocListener<UserBloc, UserBlocState>(
              listener: (context, state) {
                if (state is ErrorUserBlocState) {
                  setState(() {
                    error = state.message;
                  });
                } else if (state is MessageUserBlocState) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const BaseScreen()),
                      (Route<dynamic> route) => false);
                }
              },
              child: SizedBox(
                height: 38,
                child: Center(
                  child: Text(
                    error,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            loginBotton(context),
            loginGoogle(context),
          ],
        );
      }),
    );
  }

  Widget loginText() {
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

  Widget navigationButton(context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        showModalBottomSheet<dynamic>(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom * 0.5,
            ),
            child: Container(
              height: 576,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36)),
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                      vertical: 40),
                  child: const CreateAccountPage()),
            ),
          ),
        );
      },
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
    );
  }

  Widget controllerLabel(
      TextEditingController controller, String label, bool controllerColor) {
    return Text(
      label,
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
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

  Widget forgetPassword(context) {
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

  Widget loginBotton(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: TextButton(
        onPressed: () {
          if (emailColor && passwordColor) {
            loginAccount(context);
          } else {
            setState(() {
              error = "FILL IN THE MISSING FIELDS";
            });
          }
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
            child: BlocBuilder<UserBloc, UserBlocState>(
              builder: (context, state) {
                if (state is LodingUserBlocState) {
                  return const LoadingWidget();
                } else {
                  return Text(
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
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  void loginAccount(context) {
    final userCred = User(
      fullname: "",
      email: email.text,
      password: password.text,
    );
    BlocProvider.of<UserBloc>(context).add(
      LoginuserEvent(
        user: userCred,
      ),
    );
  }

  Widget loginGoogle(context) {
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
