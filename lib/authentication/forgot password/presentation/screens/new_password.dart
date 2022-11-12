import 'package:flutter/material.dart';
import 'package:restaurent_app/authentication/forgot%20password/presentation/screens/second_success_page.dart';
import 'package:restaurent_app/authentication/forgot%20password/presentation/screens/success_operation.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';
import 'package:restaurent_app/core/widgets/text_field_input.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController pass1 = TextEditingController();
  TextEditingController pass2 = TextEditingController();

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
                'Change New Password',
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
                'Enter your new password below',
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
                '  New Password',
                style: TextStyle(
                  fontSize: 16.0,
                  wordSpacing: 1,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                  color: Color(pass1.toString().isEmpty
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
                    hintText: '**************',
                    textEditingController: pass1,
                    textInputType: TextInputType.text,
                    isPass: true,
                    onChangedFunc: (value) {},
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '  Confirm New Password',
                style: TextStyle(
                  fontSize: 16.0,
                  wordSpacing: 1,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                  color: Color(pass2.toString().isEmpty
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
                    hintText: '**************',
                    textEditingController: pass2,
                    textInputType: TextInputType.text,
                    isPass: true,
                    onChangedFunc: (value) {},
                  ),
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
                            builder: (context) => SecondSucessPage()),
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
