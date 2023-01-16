import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:locker/src/bloc/tracking_bloc/tracking_bloc.dart';
import 'package:locker/src/models/prealert_model.dart';
import 'package:locker/src/repositories/trackings.dart';
import 'package:locker/src/repositories/users.dart';
// import 'package:locker/src/repositories/trackings.dart';

part 'prealert_event.dart';
part 'prealert_state.dart';

class PrealertBloc extends Bloc<PrealertEvent, PrealertState> {
  // final TrackingRepository _trackingRepository;

  PrealertBloc() : super(PrealertInitial());

  @override
  Stream<PrealertState> mapEventToState(
    PrealertEvent event,
  ) async* {
    if (event is SavePrealert) {
      yield PrealertLoading();
      try {
        final String loggedUserString = await (UserRepository().getLoggedUser() as FutureOr<String>);
        Map<String, dynamic> _loggedUser = jsonDecode(loggedUserString);
        final data = {
          'tracking': event.tracking,
          'contenido': event.content,
          'instruccion': event.instruction,
          'despachar': event.dispatch,
          'agencia_id': _loggedUser['agencia_id'],
          'consignee_id': _loggedUser['id'],
          'correo': _loggedUser['email'],
        };
        final PrealertModel response =
            await (TrackingRepository().savePrealert(data) as FutureOr<PrealertModel>);
        if (response.message != null) {
          yield PrealertError(error: response.message);
        } else {
          yield PrealertSuccess();
        }
      } catch (error) {
        print('ERROR EN BLOC : $error');
        yield PrealertError(error: error.toString());
      }
    }
  }
}
