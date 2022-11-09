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

class UserRemoteDataSource implements BaseUserRemoteDateSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Unit> createUser(UserModel userModel) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.password);

      UserModel _user = UserModel(
          id: cred.user!.uid,
          email: userModel.email,
          fullname: userModel.fullname,
          password: userModel.password);

      // adding user in our database
      await _firestore
          .collection("users")
          .doc(cred.user!.uid)
          .set(_user.toJson());
    } on FirebaseAuthException catch (e) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              statusCode: 404,
              statusMessage: e.message.toString(),
              success: false));
    }
    return Future.value(unit);
  }

  @override
  Future<Unit> loginUser(UserModel userModel) async {
    try {
      UserCredential cred = await _auth.signInWithEmailAndPassword(
          email: userModel.email, password: userModel.password);
    } on FirebaseAuthException catch (e) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              statusCode: 404,
              statusMessage: e.message.toString(),
              success: false));
    }
    return Future.value(unit);
  }
}
