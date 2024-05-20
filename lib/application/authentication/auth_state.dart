part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {}

class GoogleLoading extends AuthState {}

class ForgotPasswordLoading extends AuthState {}

class ForgotPasswordSuccess extends AuthState {}

class LogOutSuccess extends AuthState {}

class LoginSuccess extends AuthState {}

class GoogleSuccess extends AuthState {}

class SignupSuccess extends AuthState {}

class AuthFailed extends AuthState {
  final String message;

  const AuthFailed(this.message);
  @override
  List<Object> get props => [message];
}
