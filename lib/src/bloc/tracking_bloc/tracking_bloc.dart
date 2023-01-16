import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:locker/src/models/tracking_model.dart';
import 'package:locker/src/repositories/trackings.dart';

part 'tracking_event.dart';
part 'tracking_state.dart';

class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  TrackingBloc() : super(TrackingInitial()) {
    on<GetAllTracking>((event, emit) async {
      try {
        emit(TrackingLoading());
        final _listTracking = await trackingRepository.getAll('casillero');
        // print('EL MELO DE ACÁ : ${_listTracking.data}');
        emit(TrackingLoaded(_listTracking));
        if (_listTracking.error != null) {
          emit(TrackingError(_listTracking.error));
        }
      } catch (e) {
        print(e);
        emit(TrackingError(e.toString()));
      }
    });
  }

  final TrackingRepository trackingRepository = TrackingRepository();
}
