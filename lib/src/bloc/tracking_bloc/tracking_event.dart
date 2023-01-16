part of 'tracking_bloc.dart';

abstract class TrackingEvent extends Equatable {
  const TrackingEvent();

  @override
  List<Object> get props => [];
}

class GetAllTracking extends TrackingEvent {
  @override
  List<Object> get props => [];
}
