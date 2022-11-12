import 'package:flutter/material.dart';
import 'package:restaurent_app/authentication/forgot%20password/presentation/screens/success_operation.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';
import 'package:restaurent_app/core/widgets/text_field_input.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: 110),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forget Password',
                style: TextStyle(
                  fontSize: 20.0,
                  wordSpacing: 1,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                  color: Color(AppColors.belowBlack),
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 8,
              ),

              Text(
                'Enter your registered email below',
                style: TextStyle(
                  fontSize: 16.0,
                  wordSpacing: 1,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                  color: Color(AppColors.textController),
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 56,
              ),
              // const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
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
                    textInputType: TextInputType.text,
                    onChangedFunc: (value) {
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: Color(AppColors.textController),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.7,
                    height: 1.5,
                  ),
                  children: <TextSpan>[
                    const TextSpan(text: '  Remember the password? '),
                    TextSpan(
                        text: 'Sign In ',
                        style: TextStyle(color: Color(AppColors.mainGreen))),
                  ],
                ),
              ),
              Spacer(
                flex: 1,
              ), // <-- Spacer

              // Expanded(child: SizedBox.shrink()), // <-- Expanded

              Padding(
                padding: EdgeInsets.symmetric(vertical: 60),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => SuccessScreen()),
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
                        'Submit',
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
      ),
    );
  }
}
