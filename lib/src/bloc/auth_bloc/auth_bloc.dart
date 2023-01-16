// import 'dart:async';
import 'package:locker/src/repositories/users.dart';
// import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'auth.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({required this.userRepository})
      : super(AuthenticationUninitialized()) {
    on<AppStarted>((event, emit) async {
      final bool hasToken = await UserRepository.hasToken();
      if (hasToken) {
        emit(AuthenticationAuthenticated());
      } else {
        emit(AuthenticationUnauthenticated());
      }
    });
    on<LoggedOut>((event, emit) async {
      emit(AuthenticationLoading());
      await userRepository.deleteToken();
      await userRepository.deleteLoggedUser();
      emit(AuthenticationUnauthenticated());
    });
  }

  // @override
  // Stream<AuthenticationState> mapEventToState(
  //   AuthenticationEvent event,
  // ) async* {
  //   if (event is AppStarted) {}

  //   if (event is LoggedIn) {
  //     yield AuthenticationLoading();
  //     await userRepository.persistToken(event.token);
  //     yield AuthenticationAuthenticated();
  //   }

  //   if (event is LoggedOut) {
  //     yield AuthenticationLoading();
  //     await userRepository.deleteToken();
  //     await userRepository.deleteLoggedUser();
  //     yield AuthenticationUnauthenticated();
  //   }
  // }
}
