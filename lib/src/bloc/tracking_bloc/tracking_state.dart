part of 'tracking_bloc.dart';

abstract class TrackingState extends Equatable {
  const TrackingState();

  @override
  List<Object?> get props => [];
}

class TrackingInitial extends TrackingState {}

class TrackingLoading extends TrackingState {}

class TrackingLoaded extends TrackingState {
  final data;

  TrackingLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class TrackingError extends TrackingState {
  final String? message;

  TrackingError(this.message);
  @override
  List<Object?> get props => [message];
}
