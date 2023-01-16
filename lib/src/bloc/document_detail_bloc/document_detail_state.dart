part of 'document_detail_bloc.dart';

abstract class DocumentDetailState extends Equatable {
  const DocumentDetailState();

  @override
  List<Object?> get props => [];
}

class DocumentDetailInitial extends DocumentDetailState {}

class DocumentDetailLoading extends DocumentDetailState {}

class DocumentDetailLoaded extends DocumentDetailState {
  final DocumentDetailModel data;
  DocumentDetailLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class DocumentDetailError extends DocumentDetailState {
  final String? message;
  DocumentDetailError(this.message);
  @override
  List<Object?> get props => [message];
}
