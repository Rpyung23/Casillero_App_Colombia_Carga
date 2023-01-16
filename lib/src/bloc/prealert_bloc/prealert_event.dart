part of 'prealert_bloc.dart';

abstract class PrealertEvent extends Equatable {
  const PrealertEvent();

  @override
  List<Object> get props => [];
}

class SavePrealert extends PrealertEvent {
  // final PrealertModel prealertModel = PrealertModel();
  final String tracking;
  final String content;
  final String instruction;
  final bool dispatch;

  SavePrealert(this.tracking, this.content, this.instruction, this.dispatch);

  @override
  List<Object> get props => [tracking, content, instruction, dispatch];

  @override
  String toString() => 'SavePrealertEvent';
}
