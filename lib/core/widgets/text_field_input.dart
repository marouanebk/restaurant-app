import 'package:flutter/material.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final void Function(String) onChangedFunc;

  const TextFieldInput({
    Key? key,
    required this.hintText,
    this.isPass = false,
    required this.textEditingController,
    required this.textInputType,
    required this.onChangedFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      autocorrect: false,
      onChanged: onChangedFunc,
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
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
