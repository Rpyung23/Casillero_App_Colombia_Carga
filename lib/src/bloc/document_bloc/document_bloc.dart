import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:locker/src/repositories/documents.dart';
part 'document_event.dart';
part 'document_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  final DocumentRepository documentRepository = DocumentRepository();

  DocumentBloc() : super(DocumentInitial()) {
    on<GetAllDocument>((event, emit) async {
      print("TODOS LOS DOCUMENTOS");
      //emit(DocumentLoading());
      final _listDocuments = await documentRepository.getAll(event.status);
      emit(DocumentLoaded(_listDocuments));
      try {
        final _listDocuments = await documentRepository.getAll(event.status);
        emit(DocumentLoaded(_listDocuments));
        if (_listDocuments.error != null) {
          emit(DocumentError(_listDocuments.error));
        }
      } catch (e) {
        emit(DocumentError(e.toString()));
      }
    });

    on<SearchDocument>((event, emit) async* {
      //yield DocumentLoading();
      try {
        print('EL QUERY ES: ${event.query}');
        final _listDocuments =
            await documentRepository.searchDocument(event.query);
        yield DocumentLoaded(_listDocuments);
        if (_listDocuments.error != null) {
          yield DocumentError(_listDocuments.error);
        }
      } catch (e) {
        yield DocumentError(e.toString());
      }
    });
  }

  /*@override
  Stream<DocumentState> mapEventToState(
    DocumentEvent event,
  ) async* {
    if (event is GetAllDocument) {
      yield DocumentLoading();
      try {
        final _listDocuments = await documentRepository.getAll(event.status);
        yield DocumentLoaded(_listDocuments);
        if (_listDocuments.error != null) {
          yield DocumentError(_listDocuments.error);
        }
      } catch (e) {
        yield DocumentError(e.toString());
      }
    }
    if (event is SearchDocument) {
      yield DocumentLoading();
      try {
        print('EL QUERY ES: ${event.query}');
        final _listDocuments =
            await documentRepository.searchDocument(event.query);
        yield DocumentLoaded(_listDocuments);
        if (_listDocuments.error != null) {
          yield DocumentError(_listDocuments.error);
        }
      } catch (e) {
        yield DocumentError(e.toString());
      }
    }
  }*/
}
