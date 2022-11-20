import 'package:flutter/material.dart';

class FlashOffers extends StatelessWidget {
  const FlashOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 12,
        ),
        padding: const EdgeInsets.only(left: 40),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            height: 120,
            width: 280,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFFF9F06),
                  Color(0xFFFFE1B4),
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
              // border: Border.all(
              //   color: const Color(0xFFBEC5D1),
              // ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 13, left: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  flashDescription(),
                  const Spacer(),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(28),
                    ),
                    child: Image.asset(
                      'assets/flash offers/Burger.png',
                      // width: 44,
                      // height: 26,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// - assets/flash offers/Burger.png
// - assets/icons/BurgerKingLogo.png

Widget flashDescription() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset(
        'assets/flash offers/BurgerKingLogo.png',
        width: 44,
        height: 26,
      ),
      const SizedBox(
        height: 12,
      ),
      const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          "Flash Offer",
          style: TextStyle(
            fontSize: 16.0,
            wordSpacing: 1,
            letterSpacing: 1.2,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      const SizedBox(
        height: 3,
      ),
      const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          "We are here with the best\ndeserts intown.",
          style: TextStyle(
            fontSize: 7.0,
            wordSpacing: 0,
            letterSpacing: 0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 8.0,
              wordSpacing: 1,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            children: [
              TextSpan(
                text: "Order",
              ),
              WidgetSpan(
                child: SizedBox(
                  width: 2,
                ),
              ),
              WidgetSpan(
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 10,
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}
