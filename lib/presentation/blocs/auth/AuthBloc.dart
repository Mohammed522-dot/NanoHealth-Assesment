import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nano_health_assesment/domain/model/user.dart';
import 'package:nano_health_assesment/domain/repository/auth_repository.dart';

import 'package:nano_health_assesment/presentation/blocs/auth/AuthEvent.dart';
import 'package:nano_health_assesment/presentation/blocs/auth/AuthState.dart';

  class AuthBloc extends Bloc<AuthEvent, AuthState> {
    late AuthRepository authRepository;
    late User user;
    AuthBloc() : super(AuthInitial()) {
      on<AuthEvent>(_login);
    }
    Future<dynamic> _login(AuthEvent event, Emitter<AuthState> emit) async {
      if(event is Login) {
        emit(AuthLoading());
        authRepository = AuthRepository();
        await authRepository.login(event.userName,event.password )
            .then((user) {
                emit(AuthLoaded(user));
                this.user = user;

          });
      }
    }

}
