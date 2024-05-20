part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class RequestGoogleLogin extends AuthEvent {}

class RequestEmailSignUp extends AuthEvent {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  const RequestEmailSignUp({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
  @override
  List<Object> get props => [username, email, password, confirmPassword];
}

class RequestEmailLogin extends AuthEvent {
  final String email;
  final String password;

  const RequestEmailLogin({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class RequestForgotPassword extends AuthEvent {
  final String email;

  const RequestForgotPassword({required this.email});
}

class RequestSignOut extends AuthEvent {}
