// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courseup/features/Auth/data/models/my_user.dart';
import 'package:courseup/features/Auth/domain/entities/my_user_entity.dart';
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
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((user) => user);
  }

  @override
  Future<Either<Success<MyUserEntity>, Failure>> login(
    String email, String password) async {
  try {
    UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    debugPrint("Login successful for user: ${credential.user?.uid}");

    final userDoc =
        await usersCollection.doc(credential.user!.uid).get();

    if (!userDoc.exists) {
      throw Exception("User document not found in Firestore.");
    }

    MyUserEntity userEntity = MyUserEntity.fromDocument(userDoc.data()!);


    return left(Success(value: userEntity));
  } catch (e) {
    debugPrint("Login failed with error: $e");
    return right(Failure(exception: e));
  }
}

  @override
  Future<Either<Success<MyUserEntity>, Failure>> setUserData(MyUserEntity userEntity) async {
  try {
    final myUser = MyUser.fromEntity(userEntity);
    await usersCollection.doc(myUser.userId).set(myUser.toEntity().toDocument()); // Save to Firebase
    return left(Success(value: userEntity));
  } catch (e) {
    return right(Failure(exception: e));
  }
}

  @override
  Future<Either<Success<MyUserEntity>, Failure>> signUp(
      MyUserEntity userEntity, String password) async {
    try {
      MyUser myUser = MyUser.fromEntity(userEntity);
      debugPrint("email = ${myUser.email} \npassword = $password");
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: myUser.email,
        password: password,
      );
      debugPrint("my user repo iml | create success");
      myUser = myUser.copyWith(userId: user.user!.uid);
      return left(Success(value: myUser.toEntity()));
    } catch (e) {
            debugPrint("my user repo iml | create failed");

      return right(Failure(exception: e));

    }
  }

  @override
  Future<Either<Success<String>, Failure>> logout() async {
    try {
      await _firebaseAuth.signOut();
      return left(Success(value: 'Logged out successfully'));
    } catch (e) {
      return right(Failure(exception: e));
    }
  }
  
  @override
  Future<Either<Success<String>, Failure>> resetPassword(MyUserEntity userEntity) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: userEntity.email);
      return left(Success(value: 'Reset email sent successfully'));
    } catch (e) {
      return right(Failure(exception: e));
    }
  }

}
