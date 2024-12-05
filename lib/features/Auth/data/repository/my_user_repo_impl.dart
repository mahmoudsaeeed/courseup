// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courseup/features/Auth/data/models/my_user.dart';
import 'package:courseup/features/Auth/domain/repository/my_user_repo.dart';
import 'package:courseup/features/Auth/shared/error/result.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyUserRepoImpl implements MyUserRepo {
  final FirebaseAuth _firebaseAuth;

  final usersCollection = FirebaseFirestore.instance.collection('users');
  MyUserRepoImpl({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;


  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((user) => user);
  }

  @override
  Future<Either<Success<String>, Failure>> login(
      MyUser myUser, String password) async {
    try {
      //TODO (mahmoud)  why we not save the result in credential var
      await _firebaseAuth.signInWithEmailAndPassword(
        email: myUser.email,
        password: password,
      );
      return left(Success(value: 'Logged in successfully'));
    } catch (e) {
      return right(Failure(exception: e));
    }
  }

  @override
  Future<Either<Success<String>, Failure>> setUserData(MyUser myUser) async {
    try {
      await usersCollection
          .doc(myUser.userId)
          .set(myUser.toEntity().toDocument());
                debugPrint("my user repo iml | setUserData success");

      return left(Success(value: 'User modified successfully'));
    } catch (e) {
      return right(Failure(exception: e));
    }
  }

  @override
  Future<Either<Success<MyUser>, Failure>> signUp(
      MyUser myUser, String password) async {
    try {
      debugPrint("email = ${myUser.email} \npassword = $password");
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: myUser.email,
        password: password,
      );
      debugPrint("my user repo iml | create success");
      myUser = myUser.copyWith(userId: user.user!.uid);
      return left(Success(value: myUser));
    } catch (e) {
            debugPrint("my user repo iml | create failed");

      return right(Failure(exception: e));

    }
  }

  @override
  Future<Either<Success<String>, Failure>> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return left(Success(value: 'Logged out successfully'));
    } catch (e) {
      return right(Failure(exception: e));
    }
  }
}
