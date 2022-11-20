import 'package:flutter/material.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 17),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 6,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
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
                Container(
                  height: 64,
                  // width: double.infinity,
                  width: 64,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/47473872-10156939886597417-1406602751512674304-n-1547670271.jpg?crop=1xw:1xh;center,top&resize=480:*"),
                        fit: BoxFit.cover
                        // image: AssetImage(widget.imageLink!),
                        ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ambrosia Hotel & Restaurant',
                        style: TextStyle(
                          fontSize: 16.0,
                          wordSpacing: 1,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F2937),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      // const SizedBox(
                      //   height: 6,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RichText(
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
                                const TextSpan(
                                  text: "kazi Deiry, s",
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          //was here

                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 28,
                              width: 88,
                              alignment: Alignment.centerRight,
                              // padding: EdgeInsets.symmetric(vertical: 60),
                              decoration: BoxDecoration(
                                color: Color(AppColors.mainGreen),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: const Center(
                                child: Text(
                                  'Check',
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
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                // try here
              ],
            ),
          );
        },
      ),
    );
  }
}
