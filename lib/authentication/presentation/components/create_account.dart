import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:restaurent_app/authentication/presentation/components/login_page.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';
import 'package:restaurent_app/core/widgets/text_field_input.dart';

class CreateAccountPage extends StatefulWidget {
  TextEditingController email = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController pass = TextEditingController();
  CreateAccountPage({email, fullname, pass, super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
            ),
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
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          '  Full Name',
          style: TextStyle(
            fontSize: 16.0,
            wordSpacing: 1,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w600,
            color: Color(widget.fullname.toString().isEmpty
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
                hintText: 'Enter Your full name',
                textEditingController: widget.fullname,
                textInputType: TextInputType.text),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 15)),
        Text(
          '  Email Adress',
          style: TextStyle(
            fontSize: 16.0,
            wordSpacing: 1,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w600,
            color: Color(widget.email.toString().isEmpty
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
                textEditingController: widget.email,
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
            color: Color(widget.pass.toString().isEmpty
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
              textEditingController: widget.pass,
              textInputType: TextInputType.text,
              isPass: true,
            ),
          ),
        ),
        SizedBox(
          height: 30,
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
        ),
      ],
    );
  }
}
