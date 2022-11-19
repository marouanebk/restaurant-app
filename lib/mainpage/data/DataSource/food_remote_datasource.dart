import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurent_app/mainpage/data/Models/food_model.dart';

abstract class BaseFoodRemoteDataSource {
  Future<List<FoodModel>?> getNewArrivals();
}

class FoodRemoteDataSource extends BaseFoodRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<List<FoodModel>?> getNewArrivals() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection("food").get();
    List<FoodModel> response =
        snapshot.docs.map((d) => FoodModel.fromJson(d.data())).toList();

    return response;
  }
}
