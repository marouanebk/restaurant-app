import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: 40),
          child: Column(
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
              SizedBox(height: 5,),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style:  TextStyle(
                    color: Color(AppColors.textController),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.7,
                    height: 1.5,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                        text:
                            '  Remember the password? '),
                    TextSpan(
                        text: 'Sign In ',
                        style: TextStyle(color: Color(AppColors.mainGreen))),
                    
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
