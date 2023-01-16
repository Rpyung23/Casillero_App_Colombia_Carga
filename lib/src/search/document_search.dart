import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hexcolor/hexcolor.dart';
import 'package:locker/src/bloc/document_bloc/document_bloc.dart';
import 'package:locker/src/models/document_model.dart';
// import 'package:locker/src/repositories/documents.dart';
// import 'package:locker/src/utils/icon_from_string_util.dart';
import 'package:locker/src/style/theme.dart' as Style;

class DocumentSearch extends SearchDelegate<Document?> {
  final List<Document> history;
  final String searchFieldLabel;
  final Bloc<DocumentEvent, DocumentState> documentBloc;

  DocumentSearch(this.history, this.searchFieldLabel, this.documentBloc);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => this.query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => this.close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    documentBloc.add(SearchDocument(query));

    return BlocBuilder(
      bloc: documentBloc,
      builder: (context, dynamic state) {
        if (state is DocumentInitial) {
          return CircularProgressIndicator();
        } else if (state is DocumentLoading) {
          return CircularProgressIndicator();
        } else if (state is DocumentLoaded) {
          print('EN SEARCH FILE : ${state.data.data}');
          return ListView.builder(
            itemCount: state.data.data.length,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                leading: Icon(Icons.location_city),
                title: Text(state.data.data[index].numWarehouse),
                onTap: () => close(context, state.data.data[index]),
              );
            },
          );
        } else if (state is DocumentError) {
          return Center(
            child: Text(state.message!),
          );
        } else {
          return Container();
        }
      },
    );

    // if (query.trim().length == 0) {
    //   return Text('no hay valor en el query');
    // }

    // final documentRepository = new DocumentRepository();
    // // query!
    // return FutureBuilder(
    //   future: documentRepository.searchDocument(query),
    //   builder: (_, AsyncSnapshot snapshot) {
    //     if (snapshot.hasError) {
    //       return ListTile(title: Text('No se ecnontró el documento'));
    //     }

    //     if (snapshot.hasData) {
    //       // crear la lista
    //       return _showDocuments(snapshot.data);
    //     } else {
    //       // Loading
    //       return Center(child: CircularProgressIndicator(strokeWidth: 4));
    //     }
    //   },
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _showDocuments(history);
  }

  Widget _showDocuments(List<Document> documents) {
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (context, i) {
        final document = documents[i];
        return Card(
          elevation: 4.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: ListTile(
            contentPadding: EdgeInsets.all(8.0),
            leading: Container(
              alignment: Alignment.center,
              width: 50.0,
              child: Icon(
                Icons.ac_unit_outlined,
                color: Style.Colors.mainColor,
                size: 30.0,
              ),
            ),
            title: Text(
              document.numWarehouse!,
              style: TextStyle(
                fontSize: 20.0,
                color: Style.Colors.titleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    document.description ?? '',
                    style: TextStyle(fontFamily: 'Arial'),
                  ),
                  Text(
                    document.dateStatus!,
                    style: TextStyle(fontFamily: 'Arial'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
