import 'package:cookcy/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, User?>> getSignInWithGoogle();

  Future<Either<Failure, void>> getCreateUserInDatabase(
      User user, String? username);

  Future<Either<Failure, User?>> getSignUpWithEmail(
      String username, String email, String password);

  Future<Either<Failure, User?>> getSignInWithEmail(
      String email, String password);

  Future<Either<Failure, void>> getForgotPassword(String email);

  Future<Either<Failure, void>> getSignOutUser();
}
