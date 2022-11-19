import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:restaurent_app/authentication/data/Models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUserRemoteDateSource {
  Future<Unit> createUser(UserModel userModel);
  Future<Unit> loginUser(UserModel userModel);
  Future<Unit> logOutUser();
  Future<bool> authenticationState();
  Future<UserModel> getUserDetails();
}

class UserRemoteDataSource extends BaseUserRemoteDateSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Unit> createUser(UserModel userModel) async {
    UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: userModel.email, password: userModel.password);
    UserModel user = UserModel(
        id: cred.user!.uid,
        email: userModel.email,
        fullname: userModel.fullname,
        password: userModel.password);
    await _firestore.collection("users").doc(cred.user!.uid).set(user.toJson());

    return Future.value(unit);
  }

  @override
  Future<Unit> loginUser(UserModel userModel) async {
    UserCredential cred = await _auth.signInWithEmailAndPassword(
      email: userModel.email,
      password: userModel.password,
    );

    return Future.value(unit);
  }

  @override
  Future<Unit> logOutUser() async {
    await _auth.signOut();

    return Future.value(unit);
  }

  @override
  Future<bool> authenticationState() {
    Future<bool> temp = Future.value(false);
    var user = _auth.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          temp = Future.value(false);
        } else {
          temp = Future.value(true);
        }
      },
    );

    return temp;
  }

  @override
  Future<UserModel> getUserDetails() async {
    String uid = _auth.currentUser!.uid;

    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(uid).get();
    Map<String, dynamic>? data = docSnapshot.data();

    final UserModel userModel = UserModel(
      fullname: data?["fullname"],
      email: data?["email"],
      password: data?["password"],
    );
    // var value = data?['some_field'];

    return userModel;
  }
}
