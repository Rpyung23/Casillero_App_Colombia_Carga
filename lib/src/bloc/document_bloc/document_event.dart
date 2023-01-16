part of 'document_bloc.dart';

abstract class DocumentEvent extends Equatable {
  const DocumentEvent();

  @override
  List<Object?> get props => [];
}

class GetAllDocument extends DocumentEvent {
  final String? status;
  GetAllDocument(this.status);
  @override
  List<Object?> get props => [status];
}

class SearchDocument extends DocumentEvent {
  final String query;
  SearchDocument(this.query);
  @override
  List<Object> get props => [query];
}
