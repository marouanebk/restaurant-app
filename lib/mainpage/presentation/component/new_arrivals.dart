import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurent_app/core/utils/enums.dart';
import 'package:restaurent_app/mainpage/presentation/controller/Food/food_bloc.dart';

class TodayArrivals extends StatefulWidget {
  const TodayArrivals({super.key});

  @override
  State<TodayArrivals> createState() => _TodayArrivalsState();
}

class _TodayArrivalsState extends State<TodayArrivals> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(builder: (context, state) {
      switch (state.getNewArrivalsState) {
        case RequestState.loading:
          return const SizedBox(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );

        case RequestState.loaded:
          return SizedBox(
            height: 196,
            child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                      width: 12,
                    ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(right: 12.0),

                // padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      border: Border.all(
                        color: const Color(0xFFBEC5D1),
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      right: 10.0,
                      top: 10.0,
                      left: 10.0,
                      bottom: 20.0,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          picture(),
                          const SizedBox(
                            height: 16,
                          ),
                          title(),
                          location(),
                        ]),
                  );
                }),
          );
        case RequestState.error:
          return SizedBox(
            height: 400,
            child: Text(state.getNewArrivalsmessage),
          );
      }
    });
  }
}

Widget picture() {
  return InkWell(
    child: Container(
      height: 103.3,
      // width: double.infinity,
      width: 128,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        color: Colors.white,
        image: DecorationImage(
            image: NetworkImage(
                "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/47473872-10156939886597417-1406602751512674304-n-1547670271.jpg?crop=1xw:1xh;center,top&resize=480:*"),
            fit: BoxFit.cover
            // image: AssetImage(widget.imageLink!),
            ),
      ),
    ),
  );
}

Widget title() {
  return const Text(
    'Chiken Biryani',
    style: TextStyle(
      fontSize: 16.0,
      wordSpacing: 1,
      letterSpacing: 1.2,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1F2937),
    ),
    textAlign: TextAlign.start,
  );
}

Widget location() {
  return const Text(
    'Ambrosia Hotel &\n Restaurant',
    style: TextStyle(
      fontSize: 10.0,
      wordSpacing: 1,
      letterSpacing: 1.2,
      fontWeight: FontWeight.w400,
      color: Color(0xFF1F2937),
    ),
    textAlign: TextAlign.start,
  );
}
