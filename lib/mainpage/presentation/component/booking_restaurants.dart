import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';
import 'package:restaurent_app/core/utils/enums.dart';
import 'package:restaurent_app/mainpage/presentation/controller/Food/food_bloc.dart';
import 'package:restaurent_app/mainpage/presentation/screens/item_detail_screen.dart';
import 'package:restaurent_app/mainpage/presentation/screens/map_screen.dart';

class BookingRestaurant extends StatefulWidget {
  const BookingRestaurant({super.key});

  @override
  State<BookingRestaurant> createState() => _BookingRestaurantState();
}

class _BookingRestaurantState extends State<BookingRestaurant> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      buildWhen: (previous, current) =>
          previous.getRestaurantsState != current.getRestaurantsState,
      builder: (context, state) {
        switch (state.getRestaurantsState) {
          case RequestState.loading:
            return const SizedBox(
              height: 196,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.loaded:
            return Padding(
              padding: const EdgeInsets.only(right: 17),
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 6,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.getRestaurants.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 88,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        picturebooking(state.getRestaurants[index].picture),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, right: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                titleBooking(state.getRestaurants[index].name),
                                Row(
                                  children: [
                                    locationBooking(
                                        state.getRestaurants[index].location),
                                    const Spacer(),
                                    bookButton(context,
                                        state.getRestaurants[index].id),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 400,
              child: Text(state.getRestaurantsmessage),
            );
        }
      },
    );
  }

  Widget picturebooking(picture) {
    return Container(
      height: 64,
      width: 64,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: Colors.white,
        image: DecorationImage(
          image: NetworkImage(
            picture,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget titleBooking(name) {
    return Text(
      name,
      style: const TextStyle(
        fontSize: 16.0,
        wordSpacing: 1,
        letterSpacing: 1.2,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1F2937),
      ),
      textAlign: TextAlign.start,
    );
  }

  Widget bookButton(context, id) {
    return InkWell(
      onTap: () => Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(
          builder: (_) => ItemDetailScreen(id: id),
        ),
      ),
      child: Container(
        height: 28,
        width: 88,
        alignment: Alignment.centerRight,
        // padding: EdgeInsets.symmetric(vertical: 60),
        decoration: BoxDecoration(
          color: Color(AppColors.mainGreen),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: const Center(
          child: Text(
            'Book',
            style: TextStyle(
              fontSize: 12.0,
              wordSpacing: 1,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget locationBooking(location) {
    return InkWell(
      onTap: () {
        Navigator.of(context, ).push(
          MaterialPageRoute(
            builder: (_) => MapSample(),
          ),
        );
      },
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 10.0,
            wordSpacing: 1,
            letterSpacing: 1.2,
            fontWeight: FontWeight.normal,
            color: Color(0xFF1F2937),
          ),
          children: [
            WidgetSpan(
              child: Icon(
                Icons.location_on,
                size: 16,
                color: Color(AppColors.mainGreen),
              ),
            ),
            const WidgetSpan(
                child: SizedBox(
              width: 2,
            )),
            TextSpan(
              text: location,
            ),
          ],
        ),
      ),
    );
  }
}
