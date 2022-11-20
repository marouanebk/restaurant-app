import 'package:flutter/material.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';

class SearchFieledInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  const SearchFieledInput(
      {Key? key,
      required this.hintText,
      this.isPass = false,
      required this.textEditingController,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      autocorrect: false,
      enableSuggestions: false,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: Color(AppColors.textController),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        fillColor: const Color(0xFFE6E7E9),
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
