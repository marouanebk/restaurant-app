import 'package:flutter/material.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';
import 'package:restaurent_app/core/widgets/text_field_input.dart';

Column create_page(fullname, email, pass) {
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
                decoration: TextDecoration.underline,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: () {},
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
          color: Color(fullname.toString().isEmpty
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
              textEditingController: fullname,
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
          color: Color(pass.toString().isEmpty
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
            textEditingController: pass,
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
