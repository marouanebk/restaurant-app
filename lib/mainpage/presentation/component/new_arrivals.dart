import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';
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
    return BlocBuilder<FoodBloc, FoodState>(
        buildWhen: (previous, current) =>
            previous.getNewArrivalsState != current.getNewArrivalsState,
        builder: (context, state) {
          switch (state.getNewArrivalsState) {
            case RequestState.loading:
              return const SizedBox(
                height: 196,
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
                    itemCount: state.getNewArrivals.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 148,
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
                              picture(state.getNewArrivals[index].picture),
                              const SizedBox(
                                height: 16,
                              ),
                              title(state.getNewArrivals[index].name),
                              location(state.getNewArrivals[index].restaurant),
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

Widget picture(pic) {
  return InkWell(
    child: Container(
      height: 103.3,
      width: 128,
      child: CachedNetworkImage(
        imageUrl: pic,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            color: Colors.white,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
            ),
          ),
        ),
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    ),
  );
}

Widget title(title) {
  return Text(
    title,
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

Widget location(loc) {
  return RichText(
    text: TextSpan(
      style: const TextStyle(
        fontSize: 10.0,
        wordSpacing: 1,
        letterSpacing: 1.2,
        fontWeight: FontWeight.w500,
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
          text: loc,
        ),
      ],
    ),
  );
  //text align
}
