import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:locker/src/models/document_detail_model.dart';
import 'package:locker/src/repositories/documents.dart';

part 'document_detail_event.dart';
part 'document_detail_state.dart';

class DocumentDetailBloc
    extends Bloc<DocumentDetailEvent, DocumentDetailState> {
  DocumentDetailBloc() : super(DocumentDetailInitial());

  final DocumentRepository documentRepository = DocumentRepository();

  @override
  Stream<DocumentDetailState> mapEventToState(
    DocumentDetailEvent event,
  ) async* {
    if (event is GetDocumentDetail) {
      yield DocumentDetailLoading();
      try {
        final _documentDetail =
            await documentRepository.getDetail(event.numDocument);
        yield DocumentDetailLoaded(_documentDetail);
        if (_documentDetail.error != null) {
          yield DocumentDetailError(_documentDetail.error);
        }
      } catch (e) {
        yield DocumentDetailError(e.toString());
      }
    } else {}
  }
}
