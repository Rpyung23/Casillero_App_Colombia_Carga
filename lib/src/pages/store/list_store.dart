import 'package:flutter/material.dart';
import 'package:locker/src/style/theme.dart' as Style;

class ListStore extends StatefulWidget {
  ListStore({Key? key}) : super(key: key);

  @override
  _ListStoreState createState() => _ListStoreState();
}

class _ListStoreState extends State<ListStore> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _item(Style.Colors.mainColor),
        _item(Style.Colors.secondaryColor),
        _item(Style.Colors.orange),
        _item(Style.Colors.mainColor),
        _item(Style.Colors.titleColor),
      ],
    );
  }

  Widget _item(Color colorStatus) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: ListTile(
        contentPadding: EdgeInsets.all(8.0),
        leading: ElevatedButton(
          onPressed: () => null,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 30.0,
          ),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10.0),
              shape: CircleBorder(),
              primary: colorStatus),
        ),
        trailing: Icon(Icons.keyboard_arrow_down),
        title: Text(
          'WH00026512P1',
          style: TextStyle(
            fontSize: 20.0,
            color: Style.Colors.titleColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Enero 12 del 2020',
          style: TextStyle(fontFamily: 'Arial'),
        ),
      ),
    );
  }
}
