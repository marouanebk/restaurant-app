import 'package:flutter/material.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';
import 'package:restaurent_app/mainpage/presentation/component/booking_restaurants.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 67,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(AppColors.mainGreen),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0)),
                ),
                child: bookingHistoryTitle(),
              ),
              const SizedBox(
                height: 24,
              ),
              // const OrderHistory(),
              const BookingRestaurant(),
              SizedBox(
                height: 43,
                width: 142,
                child: Row(
                  children: [
                    const Icon(Icons.add),
                    const Text(
                      'Booking more',
                      style: TextStyle(
                        fontSize: 16.0,
                        wordSpacing: 1,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36,)
            ],
          ),
        ),
      ),
    );
  }
}

Widget bookingHistoryTitle() {
  return const Center(
    child: Text(
      'Booking history',
      style: TextStyle(
        fontSize: 16.0,
        wordSpacing: 1,
        letterSpacing: 1.2,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );
}
