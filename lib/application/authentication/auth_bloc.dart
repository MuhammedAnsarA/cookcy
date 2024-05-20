import 'package:cookcy/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cookcy/domain/authentication/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;
  AuthBloc(
    this._repository,
  ) : super(LoginInitial()) {
    on<RequestGoogleLogin>((event, emit) async {
      emit(GoogleLoading());

      final Either<Failure, User?> user =
          await _repository.getSignInWithGoogle();

      user.fold(
        (failure) => emit(AuthFailed(failure.errorMessage)),
        (_) => emit(GoogleSuccess()),
      );
    });

    on<RequestEmailSignUp>((event, emit) async {
      emit(AuthLoading());

      final Either<Failure, User?> user = await _repository.getSignUpWithEmail(
        event.username,
        event.email,
        event.password,
      );

      user.fold(
        (failure) => emit(AuthFailed(failure.errorMessage)),
        (success) => emit(SignupSuccess()),
      );
    });

    on<RequestEmailLogin>((event, emit) async {
      emit(AuthLoading());

      final Either<Failure, User?> user =
          await _repository.getSignInWithEmail(event.email, event.password);
      user.fold(
        (failure) => emit(AuthFailed(failure.errorMessage)),
        (_) => emit(LoginSuccess()),
      );
    });

    on<RequestSignOut>((event, emit) async {
      emit(AuthLoading());
      final Either<Failure, void> user = await _repository.getSignOutUser();
      user.fold(
        (failure) => emit(AuthFailed(failure.errorMessage)),
        (_) => emit(LogOutSuccess()),
      );
    });

    on<RequestForgotPassword>((event, emit) async {
      emit(ForgotPasswordLoading());
      final Either<Failure, void> user =
          await _repository.getForgotPassword(event.email);
      user.fold(
        (failure) => emit(AuthFailed(failure.errorMessage)),
        (_) => emit(ForgotPasswordSuccess()),
      );
    });
  }
}
