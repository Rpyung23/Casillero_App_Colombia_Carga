import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:locker/src/models/CheckProfileComplete.dart';
import 'package:locker/src/pages/document/document_page.dart';
import 'package:locker/src/pages/entregado/entregado_page.dart';
import 'package:locker/src/pages/tracking/tracking_page.dart';
import 'package:locker/src/pages/transito/transito_page.dart';
import 'package:locker/src/repositories/firebase_messaging.dart';
import 'package:locker/src/repositories/users.dart';
import 'package:locker/src/widgets/appBar.dart';
import 'package:locker/src/widgets/bottomBar.dart';
import 'package:locker/src/style/theme.dart' as Style;
import 'package:locker/onesignal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  int _tabActive = 0;
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _userRepository = UserRepository();
  Map<String, dynamic>? _loggedUser = {};
  @override
  void initState() {
    super.initState();
    _checkProfileComplete();
    FirebaseMessagingRepositories.updateTokenFirebase();

    /*PushNotificationService.notificationStream.listen((event) {
      print('===== EN EL HOME $event ===================');

      Navigator.pushNamed(
        context,
        'document',
        arguments: {'type': 'transito'},
      );
    });*/
    //_getDataLoggedUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(),
        body: _getViewPage(),
        bottomNavigationBar: _getBottomBar());
  }

  /*Future<Map<String, dynamic>?> _getDataLoggedUser() async {
    final String loggedUserString =
        await (_userRepository.getLoggedUser() as FutureOr<String>);
    Map<String, dynamic>? loggedUser = jsonDecode(loggedUserString);
    // print(loggedUser);
    setState(() {
      _loggedUser = loggedUser;
    });
    return loggedUser;
  }*/

  _getBottomBar() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
      child: BottomNavigationBar(
        selectedIconTheme: IconThemeData(size: 23.0),
        iconSize: 18.0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        backgroundColor: Style.Colors.mainColor,
        currentIndex: widget._tabActive,
        // context.select((BottomNavigationBloc bloc) => bloc.currentIndex),
        onTap: (index) {
          if (index == 4) {
            Navigator.of(context).pushNamed('profile');
          } else {
            setState(() {
              widget._tabActive = index;
            });
          }
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.boxes),
            label: 'Casillero',
            backgroundColor: Style.Colors.secondaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.plane),
            label: 'Tránsito',
            backgroundColor: Style.Colors.secondaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.archive),
            label: 'Entregado',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bell),
            label: 'Prealertas',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  _getViewPage() {
    switch (widget._tabActive) {
      case 0:
        return new DocumentPage('1');
        break;
      case 1:
        return new TransitoPage('transito');
        break;
      case 2:
        return new EntregadoPage('3');
        break;
      case 3:
        return TrackingPage();
        break;
    }
  }

  _checkProfileComplete() async {
    UserRepository oU = new UserRepository();
    CheckProfileComplete oC = await oU.checkProfileComplete();

    if (oC.code == 200) {
      if (oC.profileComplete == 0) {
        Navigator.of(context).pushNamed("profile");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Error CODE != 200"), backgroundColor: Colors.red));
    }
  }
}
