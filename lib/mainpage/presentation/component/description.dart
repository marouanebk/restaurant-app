import 'package:flutter/material.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';

class TypeDescription extends StatefulWidget {
  final String type;
  final String subType;
  final int color;
  const TypeDescription({
    super.key,
    required this.type,
    required this.subType,
    this.color = 0xFF1F2937,
  });

  @override
  State<TypeDescription> createState() => _TypeDescriptionState();
}

class _TypeDescriptionState extends State<TypeDescription> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.type}",
                style: TextStyle(
                  fontSize: 16.0,
                  wordSpacing: 1,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F2937),
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${widget.subType}",
                style: TextStyle(
                  fontSize: 12.0,
                  wordSpacing: 1,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w500,
                  color: Color(AppColors.maingrey),
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 12.0,
                wordSpacing: 1,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w500,
                color: Color(widget.color),
              ),
              children: [
                TextSpan(
                  text: "See More ",
                ),
                WidgetSpan(
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: Color(widget.color),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
