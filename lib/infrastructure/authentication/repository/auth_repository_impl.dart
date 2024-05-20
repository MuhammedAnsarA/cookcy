import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookcy/domain/authentication/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:cookcy/core/errors/failures.dart';
import 'package:cookcy/domain/authentication/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRepositoryImpl({
    required this.firebaseAuth,
    required this.firestore,
  });
  @override
  Future<Either<Failure, User?>> getSignInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignIn = await GoogleSignIn().signIn();
      if (googleSignIn == null) {
        /// User cancelled the sign in process
        debugPrint("User cancelled the sign in process.");
        return Left(CacheFailure(message: "User Cancelled", statusCode: 500));
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignIn.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await firebaseAuth.signInWithCredential(credential);

      if (authResult.user != null) {
        await getCreateUserInDatabase(authResult.user!, null);
      }

      return Right(authResult.user);
    } catch (e) {
      debugPrint(e.toString());
      return Left(CacheFailure(message: e.toString(), statusCode: 500));
    }
  }

  @override
  Future<Either<Failure, void>> getCreateUserInDatabase(
      User user, String? username) async {
    final data = UserModel(
      username: user.displayName ?? username,
      email: user.email,
      photoUrl: user.photoURL,
      phoneNumber: user.phoneNumber,
    );

    await firestore.collection("users").doc(user.uid).set(data.toJson());
    return const Right(null);
  }

  @override
  Future<Either<Failure, User?>> getSignUpWithEmail(
      String username, String email, String password) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      final user = credential.user;
      if (user != null) {
        await getCreateUserInDatabase(user, username);
      }
      return Right(user);
    } catch (e) {
      debugPrint(e.toString());
      return Left(CacheFailure(message: e.toString(), statusCode: 500));
    }
  }

  @override
  Future<Either<Failure, User?>> getSignInWithEmail(
      String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;
      return Right(user);
    } catch (e) {
      debugPrint(e.toString());
      return Left(CacheFailure(message: e.toString(), statusCode: 500));
    }
  }

  @override
  Future<Either<Failure, void>> getSignOutUser() async {
    try {
      await firebaseAuth.signOut();
      return const Right(null);
    } catch (e) {
      debugPrint(e.toString());
      return Left(CacheFailure(message: e.toString(), statusCode: 500));
    }
  }

  @override
  Future<Either<Failure, void>> getForgotPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return const Right(null);
    } catch (e) {
      debugPrint(e.toString());
      return Left(CacheFailure(message: e.toString(), statusCode: 500));
    }
  }
}
