import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  const TextFieldInput(
      {Key? key,
      required this.hintText,
      this.isPass = false,
      required this.textEditingController,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(

      controller: textEditingController,
      autocorrect: false,
      enableSuggestions: false,
      style: TextStyle(
        color: Color(AppColors.belowBlack),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: Color(AppColors.textController),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        fillColor: Colors.white,
        hintText: hintText,
        // border: InputBorder,
        focusedBorder: InputBorder,
        enabledBorder: InputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
