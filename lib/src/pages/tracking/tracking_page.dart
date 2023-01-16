import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locker/src/pages/tracking/form_prealert.dart';
import 'package:locker/src/pages/tracking/list_trackings.dart';
import 'package:locker/src/widgets/appBar.dart';
import 'package:locker/src/widgets/bottomBar.dart';
import 'package:locker/src/style/theme.dart' as Style;

class TrackingPage extends StatelessWidget {
  TrackingPage({Key? key}) : super(key: key);

  // final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // _inputSearch(),
            ListTile(
              title: Text(
                'Prealertas',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Listado de prealertas realizadas'),
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
            Expanded(
              child: ListTracking(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Style.Colors.mainColor,
        child: Icon(FontAwesomeIcons.plus),
        onPressed: () => _formAddPrealert(context),
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
  //           // fontWeight: FontWeight.bold,
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
  //       ),
  //     ),
  //   );
  // }

  void _formAddPrealert(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40.0),
        ),
      ),
      builder: (_) {
        return FormPrealert();
        // return FormPrealert();
      },
    );
  }

  // Widget _listStatus() {
  //   return ListView.builder(
  //       itemCount: 5,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (BuildContext context, item) {
  //         return _itemStatus();
  //       });
  // }

  // Widget _itemStatus() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 4.0),
  //     child: Chip(
  //       labelPadding: EdgeInsets.all(2.0),
  //       label: Text(
  //         'Prealertado',
  //         style: TextStyle(
  //           color: Colors.white,
  //         ),
  //       ),
  //       backgroundColor: Style.Colors.mainColor,
  //       elevation: 6.0,
  //       shadowColor: Colors.grey[60],
  //       padding: EdgeInsets.all(8.0),
  //     ),
  //   );
  // }
}
