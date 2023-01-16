part of 'prealert_bloc.dart';

abstract class PrealertState extends Equatable {
  const PrealertState();

  @override
  List<Object?> get props => [];
}

class PrealertInitial extends PrealertState {}

class PrealertLoading extends PrealertState {}

class PrealertSuccess extends PrealertState {
  final String? response;

  PrealertSuccess({this.response});

  @override
  List<Object?> get props => [response];
}

class PrealertError extends PrealertState {
  final String? error;

  PrealertError({this.error});

  @override
  List<Object?> get props => [error];
}
