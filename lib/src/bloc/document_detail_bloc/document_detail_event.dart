part of 'document_detail_bloc.dart';

abstract class DocumentDetailEvent extends Equatable {
  const DocumentDetailEvent();

  @override
  List<Object?> get props => [];
}

class GetDocumentDetail extends DocumentDetailEvent {
  final String? numDocument;
  GetDocumentDetail(this.numDocument);
  @override
  List<Object?> get props => [numDocument];
}
