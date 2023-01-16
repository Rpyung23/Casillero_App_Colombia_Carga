import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locker/src/bloc/document_bloc/document_bloc.dart';
import 'package:locker/src/models/document_model.dart';
import 'package:locker/src/pages/document/list_document.dart';
import 'package:locker/src/repositories/firebase_messaging.dart';
// import 'package:locker/src/search/document_search.dart';
// import 'package:locker/src/pages/document/list_status.dart';
import 'package:locker/src/widgets/appBar.dart';
import 'package:locker/src/widgets/bottomBar.dart';
import 'package:locker/src/style/theme.dart' as Style;

class EntregadoPage extends StatefulWidget {
  String type;

  EntregadoPage(String _type) : type = _type;

  @override
  State<EntregadoPage> createState() => _EntregadoPageState();
}

class _EntregadoPageState extends State<EntregadoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //FirebaseMessagingRepositories.updateTokenFirebase();
  }

  final List<Document> history = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DocumentBloc(),
      child: Scaffold(
        backgroundColor: Style.Colors.background,
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              // _inputSearch(),
              ListTile(
                title: Text(
                  'En casillero',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('Listado de documentos'),
                // trailing: IconButton(
                //   icon: Icon(FontAwesomeIcons.search),
                //   onPressed: () async {
                //     final resultSearch = await showSearch(
                //       context: context,
                //       delegate: DocumentSearch(
                //         history,
                //         'Buscar documento',
                //         BlocProvider.of<DocumentBloc>(context),
                //       ),
                //     );
                //     history.add(resultSearch);
                //   },
                // ),
              ),
              SizedBox(height: 15.0),
              // Container(
              //   height: 65.0,
              //   child: ListStatus(),
              // ),
              // SizedBox(height: 15.0),
              Expanded(
                child: new ListDocument(type: widget.type),
              )
            ],
          ),
        ),
      ),
    );
  }
  // Widget _inputSearch() {
  //   return Form(
  //     child: SingleChildScrollView(
  //       child: TextFormField(
  //         controller: _searchController,
  //         style: TextStyle(
  //           fontSize: 15.0,
  //           color: Style.Colors.titleColor,
  //           fontWeight: FontWeight.bold,
  //         ),
  //         keyboardType: TextInputType.text,
  //         decoration: InputDecoration(
  //           prefixIcon: Icon(EvaIcons.searchOutline, color: Colors.black26),
  //           enabledBorder: OutlineInputBorder(
  //               borderSide: new BorderSide(color: Colors.black12),
  //               borderRadius: BorderRadius.circular(25.0)),
  //           focusedBorder: OutlineInputBorder(
  //               borderSide: new BorderSide(color: Style.Colors.mainColor),
  //               borderRadius: BorderRadius.circular(25.0)),
  //           contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
  //           labelText: "Buscar",
  //           hintStyle: TextStyle(
  //               fontSize: 14.0,
  //               color: Style.Colors.grey,
  //               fontWeight: FontWeight.w500),
  //           labelStyle: TextStyle(
  //               fontSize: 14.0,
  //               color: Colors.grey,
  //               fontWeight: FontWeight.w500),
  //         ),
  //         autocorrect: false,
  //         onFieldSubmitted: (value) {
  //           _searchDocument(value);
  //         },
  //       ),
  //     ),
  //   );
  // }

}
