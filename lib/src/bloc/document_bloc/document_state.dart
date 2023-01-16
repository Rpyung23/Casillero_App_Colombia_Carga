part of 'document_bloc.dart';

abstract class DocumentState extends Equatable {
  const DocumentState();

  @override
  List<Object?> get props => [];
}

class DocumentInitial extends DocumentState {}

class DocumentLoading extends DocumentState {}

class DocumentLoaded extends DocumentState {
  final data;

  DocumentLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class DocumentError extends DocumentState {
  final String? message;

  DocumentError(this.message);
  @override
  List<Object?> get props => [message];
}
