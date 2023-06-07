import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';



@immutable
abstract class AuthEvent {}

class Login extends AuthEvent {
  final String userName;
  final String password;

  Login(this.userName, this.password);
}

