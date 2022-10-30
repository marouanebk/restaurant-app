import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurent_app/core/utils/const/colors.dart';
import 'package:restaurent_app/core/widgets/search_text_input.dart';
import 'package:restaurent_app/core/widgets/text_field_input.dart';

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
          padding: EdgeInsets.only(left: 20, top: 42),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                    Text(
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
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: EdgeInsets.only(left: 28, right: 47),
                child: Container(
                  height: 49,
                  decoration: BoxDecoration(
                    color: Color(0xFFE6E7E9),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    border: Border.all(color: Color(0xFFBEC5D1)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                    child: SearchFieledInput(
                        hintText: '     Search',
                        textEditingController: search,
                        textInputType: TextInputType.text),
                  ),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today New Arivable',
                          style: TextStyle(
                            fontSize: 16.0,
                            wordSpacing: 1,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F2937),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Best of the today  food list update',
                          style: TextStyle(
                            fontSize: 12.0,
                            wordSpacing: 1,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w500,
                            color: Color(AppColors.maingrey),
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Text(
                      'See More',
                      style: TextStyle(
                        fontSize: 12.0,
                        wordSpacing: 1,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1F2937),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 196,
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 196,
                        width: 148,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          border: Border.all(color: Color(0xFFBEC5D1)),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
