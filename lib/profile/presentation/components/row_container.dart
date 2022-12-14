import 'package:flutter/material.dart';

class RowContainer extends StatefulWidget {
  final IconData iconname;
  final String title;
  const RowContainer({super.key, required this.iconname, required this.title});

  @override
  State<RowContainer> createState() => _RowContainerState();
}

class _RowContainerState extends State<RowContainer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 18.0,
              wordSpacing: 1,
              letterSpacing: 1.2,
              fontWeight: FontWeight.normal,
              color: Color(0xFF374151),
            ),
            children: [
              WidgetSpan(
                child: Icon(
                  widget.iconname,
                  size: 24,
                ),
              ),
              TextSpan(
                text: "  ${widget.title}",
              ),
            ],
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          size: 14,
        ),
      ],
    );
  }
}
