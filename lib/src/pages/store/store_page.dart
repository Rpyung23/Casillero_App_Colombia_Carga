import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locker/src/pages/store/list_store.dart';
import 'package:locker/src/widgets/appBar.dart';
import 'package:locker/src/widgets/bottomBar.dart';
import 'package:locker/src/style/theme.dart' as Style;

class StorePage extends StatelessWidget {
  StorePage({Key? key}) : super(key: key);
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.background,
      appBar: AppBarWidget(),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            _inputSearch(),
            SizedBox(height: 15.0),
            Container(
              height: 60.0,
              child: _listStatus(),
            ),
            SizedBox(height: 15.0),
            Expanded(
              child: ListStore(),
            )
            // ListStore(),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarWidget(3),
    );
  }

  // Widget _inputSearch() {
  //   return Text('HJpñla');
  // }
  Widget _inputSearch() {
    return Form(
      child: SingleChildScrollView(
        child: TextFormField(
          controller: _searchController,
          style: TextStyle(
            fontSize: 15.0,
            color: Style.Colors.titleColor,
            // fontWeight: FontWeight.bold,
          ),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(FontAwesomeIcons.search, color: Colors.black26),
            enabledBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.circular(25.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Style.Colors.mainColor),
                borderRadius: BorderRadius.circular(25.0)),
            contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
            labelText: "Buscar",
            hintStyle: TextStyle(
                fontSize: 14.0,
                color: Style.Colors.grey,
                fontWeight: FontWeight.w500),
            labelStyle: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
                fontWeight: FontWeight.w500),
          ),
          autocorrect: false,
        ),
      ),
    );
  }

  Widget _listStatus() {
    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Chip(
          labelPadding: EdgeInsets.all(2.0),
          label: Text(
            'Prealertado',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Style.Colors.mainColor,
          elevation: 6.0,
          shadowColor: Colors.grey[60],
          padding: EdgeInsets.all(8.0),
        ),
        SizedBox(width: 8.0),
        Chip(
          labelPadding: EdgeInsets.all(2.0),
          label: Text(
            'En bodega',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Style.Colors.secondaryColor,
          elevation: 6.0,
          shadowColor: Colors.grey[60],
          padding: EdgeInsets.all(8.0),
        ),
        SizedBox(width: 8.0),
        Chip(
          labelPadding: EdgeInsets.all(2.0),
          label: Text(
            'En camino',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Style.Colors.grey,
          elevation: 6.0,
          shadowColor: Colors.grey[60],
          padding: EdgeInsets.all(8.0),
        ),
        SizedBox(width: 8.0),
        Chip(
          labelPadding: EdgeInsets.all(2.0),
          label: Text(
            'Entregado',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Style.Colors.fourthColor,
          elevation: 6.0,
          shadowColor: Colors.grey[60],
          padding: EdgeInsets.all(8.0),
        ),
        Chip(
          labelPadding: EdgeInsets.all(2.0),
          label: Text(
            'Retenido',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Style.Colors.titleColor,
          elevation: 6.0,
          shadowColor: Colors.grey[60],
          padding: EdgeInsets.all(8.0),
        )
      ],
    );
  }
}
