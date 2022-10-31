import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';
import 'package:restaurent_app/core/widgets/search_text_input.dart';
import 'package:restaurent_app/core/widgets/text_field_input.dart';
import 'package:restaurent_app/mainpage/presentation/component/booking_restaurants.dart';
import 'package:restaurent_app/mainpage/presentation/component/description.dart';
import 'package:restaurent_app/mainpage/presentation/component/new_arrivals.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 42),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.menu)),
                      const Text(
                        'Agrabad 435, Chittagong',
                        style: TextStyle(
                          fontSize: 12.0,
                          wordSpacing: 1,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF4B5563),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 47),
                  child: Container(
                    height: 49,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6E7E9),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      border: Border.all(color: const Color(0xFFBEC5D1)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 1),
                      child: SearchFieledInput(
                          hintText: '     Search',
                          textEditingController: search,
                          textInputType: TextInputType.text),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                TypeDescription(
                    type: "Today New Arivable",
                    subType: "Best of the today food list update"),
                const SizedBox(
                  height: 16,
                ),
                TodayArrivals(),
                const SizedBox(
                  height: 36,
                ),
                TypeDescription(
                    type: "Booking Restaurant",
                    subType: "Check your city Near by Restaurant"),
                const SizedBox(
                  height: 36,
                ),
                BookingRestaurant(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
