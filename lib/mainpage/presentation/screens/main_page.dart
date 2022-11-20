import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/onboarding.dart';
import 'package:restaurent_app/core/widgets/search_text_input.dart';
import 'package:restaurent_app/injection_container.dart';
import 'package:restaurent_app/mainpage/presentation/component/booking_restaurants.dart';
import 'package:restaurent_app/mainpage/presentation/component/description.dart';
import 'package:restaurent_app/mainpage/presentation/component/flash_offers.dart';
import 'package:restaurent_app/mainpage/presentation/component/new_arrivals.dart';
import 'package:restaurent_app/mainpage/presentation/controller/Food/food_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          sl<FoodBloc>()..add(GetNewArrivalsEvent()),
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F6F6),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  firstPadding(),
                  const SizedBox(
                    height: 18,
                  ),
                  searchBar(search),
                  const SizedBox(
                    height: 28,
                  ),
                  const FlashOffers(),
                  const SizedBox(
                    height: 18,
                  ),
                  Center(
                    child: CustomIndicator(
                      shouldPaint: true,
                      netDragPercent: 0,
                      pagesLength: 3,
                      indicator: Indicator(
                        activeIndicator: const ActiveIndicator(
                            color: Color(0xFFE2E2E2), borderWidth: 0.7),
                        closedIndicator: const ClosedIndicator(
                            color: Color(0xFF32B768), borderWidth: 0.7),
                        indicatorDesign: IndicatorDesign.polygon(
                          polygonDesign: PolygonDesign(
                            polygonRadius: 9,
                            polygon: DesignType.polygon_circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const TypeDescription(
                      type: "Today New Arivable",
                      subType: "Best of the today food list update"),
                  const SizedBox(
                    height: 16,
                  ),
                  const TodayArrivals(),
                  const SizedBox(
                    height: 36,
                  ),
                  const TypeDescription(
                      type: "Booking Restaurant",
                      subType: "Check your city Near by Restaurant"),
                  const SizedBox(
                    height: 36,
                  ),
                  const BookingRestaurant(),
                  const SizedBox(
                    height: 36,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget searchBar(search) {
  return Padding(
    padding: const EdgeInsets.only(left: 28, right: 47),
    child: Container(
      height: 49,
      decoration: BoxDecoration(
        color: const Color(0xFFE6E7E9),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: const Color(0xFFBEC5D1)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
        child: SearchFieledInput(
            hintText: '     Search',
            textEditingController: search,
            textInputType: TextInputType.text),
      ),
    ),
  );
}

Widget firstPadding() {
  return Padding(
    padding: const EdgeInsets.only(right: 15, top: 21),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
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
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
      ],
    ),
  );
}
