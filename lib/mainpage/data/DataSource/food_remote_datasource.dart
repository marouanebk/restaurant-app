import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:restaurent_app/core/error/exceptions.dart';
import 'package:restaurent_app/core/network/error_message_model.dart';
import 'package:restaurent_app/mainpage/data/Models/food_model.dart';

abstract class BaseFoodRemoteDataSource {
  Future<List<FoodModel>?> getNewArrivals();
}

class FoodRemoteDataSource extends BaseFoodRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<List<FoodModel>?> getNewArrivals() async {
    log("here in food data source ");
    // final response1 = FirebaseFirestore.instance
    //     .collection('food')
    //     .get()
    //     .then((QuerySnapshot querySnapshot) {
    //   querySnapshot.docs.forEach((doc) {

    //     log(doc.data().toString());
    //   });
    // });
    // log(response1.toString());
    // QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('food').get();
    // List<FoodModel> response = snapshot.docs.map((d) => FoodModel.fromJson(d)).toList();

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection("food").get();
    List<FoodModel> response =
        snapshot.docs.map((d) => FoodModel.fromJson(d.data())).toList();

    return response;

    // if (response.statusCode == 200) {
    // return List<FoodModel>.from((response.data["results"] as List).map(
    //   (e) => FoodModel.fromJson(e),
    // ));
    // } else {
    //   throw ServerException(
    //       errorMessageModel: ErrorMessageModel.fromJson(response.data));
    // }
  }
}
