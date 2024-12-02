import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courseup/features/Auth/data/my_user_repo.dart';
import 'package:courseup/features/Auth/data/models/my_user.dart';
import 'package:courseup/features/Auth/shared/error/result.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  Future<Either<Success<String>, Failure>> logIn(
      MyUser myUser, String password) async {
    try {
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
      return left(Success(value: 'User modified successfully'));
    } catch (e) {
      return right(Failure(exception: e));
    }
  }

  @override
  Future<Either<Success<MyUser>, Failure>> signUp(
      MyUser myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: myUser.email,
        password: password,
      );
      myUser = myUser.copyWith(userId: user.user!.uid);
      return left(Success(value: myUser));
    } catch (e) {
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
