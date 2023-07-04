import 'package:meta/meta.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  final String token;
  // final String error;
  AuthLoaded(this.token);
}

class AuthError extends AuthState {}
class ResponseError extends AuthState {}