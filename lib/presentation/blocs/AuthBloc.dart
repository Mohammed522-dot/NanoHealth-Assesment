import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:nano_health_assesment/presentation/blocs/AuthEvent.dart';
import 'package:nano_health_assesment/presentation/blocs/AuthState.dart';





  class AuthBloc extends Bloc<AuthEvent, AuthState> {
    AuthBloc() : super(AuthInitial()) {
      on<AuthEvent>((event, emit) async {
        if (event is Login) {
          if (event.userName.isEmpty || event.password.isEmpty) {
            emit(AuthError());
          } else {
            emit(AuthLoading());
            Response response = await post(
              Uri.parse('https://fakestoreapi.com/auth/login'),
              body: {
                'username' : event.userName,
                'password': event.password
              }
          );
          if(response.statusCode == 200){
            final body = jsonDecode(response.body);
            final String token = body["token"];
            print(token);
             emit(AuthLoaded());
          }
          else {
            final error = jsonDecode(response.body);
           await error['errors']['en'];
            emit(ResponseError());
            print(error);
          }
        }
      }
    });
  }
}
