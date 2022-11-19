import 'package:flutter/material.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';
import 'package:restaurent_app/mainpage/presentation/component/booking_restaurants.dart';
import 'package:restaurent_app/mainpage/presentation/component/description.dart';
import 'package:restaurent_app/mainpage/presentation/screens/map_screen.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({super.key});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 54,
                      decoration: BoxDecoration(
                        color: Color(AppColors.mainGreen),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                splashRadius: 24,
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 24,
                                )),
                            Spacer(),
                            Text(
                              'Details Restaurant',
                              style: TextStyle(
                                fontSize: 12.0,
                                wordSpacing: 1,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    firstContainer(context),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, right: 22, left: 22),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0)),
                      ),
                      child: Column(
                        children: [
                          TypeDescription(
                            type: "List other restaurant",
                            subType: "check the menu at this restaurant",
                            color: AppColors.mainGreen,
                          ),
                          const SizedBox(
                            height: 36,
                          ),
                          BookingRestaurant(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottom_bar(),
          ],
        ),
      ),
    );
  }
}

Widget firstContainer(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 358,
    padding: EdgeInsets.only(top: 20, left: 18, right: 18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tava Restaurant',
          style: TextStyle(
            fontSize: 20.0,
            wordSpacing: 1,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 12.0,
              wordSpacing: 1,
              letterSpacing: 1.2,
              fontWeight: FontWeight.normal,
              color: Color(0xFF6B7280),
            ),
            children: [
              WidgetSpan(
                child: Icon(
                  Icons.location_on,
                  size: 16,
                  color: Color(AppColors.mainGreen),
                ),
              ),
              const TextSpan(
                text: "kazi Deiry, Taiger Pass,Chittagong",
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Container(
          height: 182,
          // width: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: Colors.white,
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&w=1000&q=80"),
                fit: BoxFit.cover
                // image: AssetImage(widget.imageLink!),
                ),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 12.0,
                      wordSpacing: 1,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF1F2937),
                    ),
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.watch_later_rounded,
                          size: 16,
                          color: Color(AppColors.mainGreen),
                        ),
                      ),
                      const TextSpan(
                        text: "  Open Today",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '10:00 AM - 12:00 PM',
                  style: TextStyle(
                    fontSize: 12.0,
                    wordSpacing: 1,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .push(MaterialPageRoute(
                  builder: (_) => MapSample(),
                ));
              },
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 12.0,
                    wordSpacing: 1,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF2C8DFF),
                  ),
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.directions,
                        size: 16,
                        color: Color(0xFF2C8DFF),
                      ),
                    ),
                    const TextSpan(
                      text: "Visit the Restaurant",
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Container bottom_bar() {
  return Container(
    height: 85,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
    ),
    child: Center(
      child: Container(
        width: 232,
        height: 33,
        decoration: BoxDecoration(
            color: Color(AppColors.mainGreen),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            "Booking",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  );
}
