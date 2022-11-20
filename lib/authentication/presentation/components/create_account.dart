import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurent_app/authentication/domaine/Entities/user.dart';
import 'package:restaurent_app/authentication/presentation/controller/bloc/user_bloc_bloc.dart';
import 'package:restaurent_app/authentication/presentation/controller/bloc/user_bloc_event.dart';
import 'package:restaurent_app/authentication/presentation/components/login_page.dart';
import 'package:restaurent_app/authentication/presentation/controller/bloc/user_bloc_state.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';
import 'package:restaurent_app/core/widgets/text_field_input.dart';
import 'package:restaurent_app/injection_container.dart';
import 'package:restaurent_app/mainpage/presentation/screens/base_screen.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  bool fullnameColor = false;
  bool emailColor = false;
  bool passwordColor = false;
  String error = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserBloc>(),
      child: Builder(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
            controllerLabel("Full Name", _fullname, fullnameColor),
            // fullname_text(fullname),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            textController("Enter Your full name", _fullname, false, 1),
            const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            controllerLabel("Email Adress", _email, emailColor),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            textController("Eg namaemail@emailkamu.com", _email, false, 2),
            const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            controllerLabel("Password", _pass, passwordColor),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            textController("********", _pass, true, 3),
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
              child: errorBox(),
            ),
            registrationButton(context),
            registerGoogle(context),
          ],
        );
      }),
    );
  }

  Widget errorBox() {
    return SizedBox(
      height: 30,
      child: Center(
        child: Text(
          error,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget registrationButton(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: TextButton(
        onPressed: () {
          if (fullnameColor && emailColor && passwordColor) {
            createAccount(context);
          } else {
            setState(() {
              error = "fill the missing field";
            });
          }
        },
        child: Container(
          height: 49,
          width: double.infinity,
          decoration: BoxDecoration(
            color: (fullnameColor) && (emailColor) && (passwordColor)
                ? const Color(0xFF32B768)
                : const Color(0xFFF4F4F4),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Center(
            child: BlocBuilder<UserBloc, UserBlocState>(
              builder: (context, state) {
                if (state is LodingUserBlocState) {
                  return const LoadingWidget();
                } else {
                  return Text(
                    'Registration',
                    style: TextStyle(
                      fontSize: 14.0,
                      wordSpacing: 1,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w500,
                      color: (fullnameColor) && (emailColor) && (passwordColor)
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

  void createAccount(context) {
    final userCred = User(
      fullname: _fullname.text,
      email: _email.text,
      password: _pass.text,
    );
    BlocProvider.of<UserBloc>(context).add(CreateUserEvent(user: userCred));
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
                bottom: MediaQuery.of(context).viewInsets.bottom * 0.5),
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
                  child: const LoginPage()),
            ),
          ),
        );
      },
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
    );
  }

  Widget singupText() {
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

  Widget controllerLabel(
      String label, TextEditingController controller, bool controllerColor) {
    return Text(
      "  ${label}",
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
  //             controllerColor ? AppColors.belowBlack : AppColors.textController),

  Widget textController(String hint, TextEditingController controller,
      bool type, int controllerColor) {
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
              if (_fullname.text.isNotEmpty) {
                setState(() {
                  fullnameColor = true;
                });
              } else {
                setState(() {
                  fullnameColor = false;
                });
              }
            } else if (controllerColor == 2) {
              if (_email.text.isNotEmpty) {
                setState(() {
                  emailColor = true;
                });
              } else {
                setState(() {
                  emailColor = false;
                });
              }
            } else {
              if (_pass.text.isNotEmpty) {
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

  Widget registerGoogle(context) {
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
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: Colors.white,
    ));
  }
}

class MessageDisplayWidget extends StatelessWidget {
  final String message;
  const MessageDisplayWidget({required this.message, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
            child: Text(
          message,
          style: const TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
