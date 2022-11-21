import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurent_app/mainpage/data/Models/restaurant_detail_model.dart';
import 'package:restaurent_app/mainpage/data/Models/restaurant_model.dart';

abstract class BaseRestaurantRemoteDataSource {
  Future<List<RestaurantModel>?> getRestaurants();
  Future<RestaurantDetailModel> getRestaurantDetail(id);
}

class RestaurantRemoteDataSource extends BaseRestaurantRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<List<RestaurantModel>?> getRestaurants() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection("restaurant").get();
    List<RestaurantModel> response =
        snapshot.docs.map((d) => RestaurantModel.fromJson(d.data())).toList();

    return response;
  }

  @override
  Future<RestaurantDetailModel> getRestaurantDetail(id) async {
    var collection = FirebaseFirestore.instance.collection('restaurant');
    var docSnapshot = await collection.doc(id).get();
    Map<String, dynamic>? data = docSnapshot.data();

    final RestaurantDetailModel response = RestaurantDetailModel(
      id: data?["id"],
      name: data?["name"],
      bgpicture: data?["bgpicture"],
      location: data?["location"],
      opTime: data?["opTime"],
      clTime: data?["clTime"],
    );

    return response;
  }
}
