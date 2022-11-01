import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';
import 'package:restaurent_app/profile/presentation/components/row_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24, top: 60),
          child: Column(
            children: [
              firstContainer(),
              SizedBox(
                height: 40,
              ),
              secondContainer(),
              SizedBox(
                height: 12,
              ),
              thirdContainer(),
              SizedBox(
                height: 40,
              ),
              forthContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

Container firstContainer() {
  return Container(
    width: double.infinity,
    height: 70,
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(11.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration:
              const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Marouane bk",
                style: TextStyle(
                  fontSize: 16.0,
                  wordSpacing: 1,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF374151),
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 2,
              ),
              const Text(
                "marouaneboukandoura@gmail.com",
                style: TextStyle(
                  fontSize: 10.0,
                  wordSpacing: 1,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF6B7280),
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
              color: Color(0xFFF9F9F9), shape: BoxShape.circle),
          child: Icon(Icons.notifications),
        ),
      ],
    ),
  );
}

Container secondContainer() {
  return Container(
    width: double.infinity,
    height: 70,
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(11.0),
    ),
    child: Row(
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
                  Icons.account_circle,
                  size: 24,
                ),
              ),
              const TextSpan(
                text: "  Account setting",
              ),
            ],
          ),
        ),
        Icon(Icons.edit_note_sharp)
      ],
    ),
  );
}

Container thirdContainer() {
  return Container(
    width: double.infinity,
    height: 204,
    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(11.0),
    ),
    child: Column(
      children: [
        RowContainer(
          iconname: Icons.text_snippet_rounded,
          title: "Language",
        ),
        SizedBox(
          height: 20,
        ),
        RowContainer(
          iconname: Icons.chat,
          title: "Feedback",
        ),
        SizedBox(
          height: 20,
        ),
        RowContainer(
          iconname: Icons.star_outline_outlined,
          title: "Rate us",
        ),
        SizedBox(
          height: 20,
        ),
        RowContainer(
          iconname: Icons.arrow_circle_up,
          title: "Account version",
        ),
      ],
    ),
  );
}

Container forthContainer() {
  return Container(
    width: 111,
    height: 35,
    decoration: BoxDecoration(
      color: Color(0xFFEB4646),
      borderRadius: BorderRadius.circular(11.0),
    ),
    child: Center(
      child: Text(
        "Logout",
        style: TextStyle(
          fontSize: 16.0,
          wordSpacing: 1,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
