import 'package:meta/meta.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  // final String username;
  // final String error;
  AuthLoaded(

      // this.username,
      );
}

class AuthError extends AuthState {}
class ResponseError extends AuthState {}