import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:restaurent_app/authentication/data/Models/user_model.dart';
import 'package:restaurent_app/core/network/error_message_model.dart';
import '../../../../core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUserRemoteDateSource {
  Future<Unit> createUser(UserModel userModel);
  Future<Unit> loginUser(UserModel userModel);
}

class UserRemoteDataSource extends BaseUserRemoteDateSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Unit> createUser(UserModel userModel) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.password);
      UserModel user = UserModel(
          id: cred.user!.uid,
          email: userModel.email,
          fullname: userModel.fullname,
          password: userModel.password);
      await _firestore
          .collection("users")
          .doc(cred.user!.uid)
          .set(user.toJson());
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      
    }
    return Future.value(unit);
  }

  Future<Unit> loginUser(UserModel userModel) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: userModel.email, password: userModel.password);

    return Future.value(unit);
  }
}

Future<Unit> createAccount(UserModel userModel) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserCredential cred = await _auth.createUserWithEmailAndPassword(
      email: userModel.email, password: userModel.password);
  UserModel user = UserModel(
      id: cred.user!.uid,
      email: userModel.email,
      fullname: userModel.fullname,
      password: userModel.password);
  await _firestore.collection("users").doc(cred.user!.uid).set(user.toJson());
  log("success");

  return Future.value(unit);
} 



  // @override
  // Future<Unit> createUser(UserModel userModel) async {
  //   try {
  //     UserCredential cred = await _auth.createUserWithEmailAndPassword(
  //         email: userModel.email, password: userModel.password);
  //     UserModel user = UserModel(
  //         id: cred.user!.uid,
  //         email: userModel.email,
  //         fullname: userModel.fullname,
  //         password: userModel.password);
  //     await _firestore
  //         .collection("users")
  //         .doc(cred.user!.uid)
  //         .set(user.toJson());
  //   } on FirebaseAuthException catch (e) {
      // throw ServerException(
      //   errorMessageModel: ErrorMessageModel(
      //     statusCode: 404,
      //     statusMessage: e.message.toString(),
      //     success: false,
      //   ),
      // );
  //   }
  //   return Future.value(unit);
  // }

  // Future<Unit> createUser(UserModel userModel) async {
  //   return createAccount(userModel).then(

  //     throw ServerException(
  //       errorMessageModel: ErrorMessageModel(
  //         statusCode: 404,
  //         statusMessage: "e.message.toString()",
  //         success: false,
  //       ),
  //     ),
  //   );
  // }