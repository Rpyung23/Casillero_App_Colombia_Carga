import 'dart:async';
import 'dart:convert';
import 'package:locker/src/bloc/auth_bloc/auth.dart';
// import 'package:locker/src/models/user_model.dart';
import 'package:locker/src/repositories/users.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
//import 'package:onesignal_flutter/onesignal_flutter.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.userRepository,
    required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final data = await userRepository.login(event.email, event.password);
        final user = jsonDecode(data["user"]);
        // Guarar datos del usuario en local
        userRepository.persistData(user);
        if (data['access_token'] != null) {
          await userRepository.persistUserId(user['id'].toString());
          /* await OneSignal.shared
              .setExternalUserId(user['id'].toString())
              .then((value) => {print('ASIGNANDO ID EXTERNO: $value')});*/
          authenticationBloc.add(LoggedIn(token: data['access_token']));
          yield LoginInitial();
        } else {
          throw ("Error al inicar sesión THROW");
        }
      } catch (error) {
        print('Error: $error');
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
