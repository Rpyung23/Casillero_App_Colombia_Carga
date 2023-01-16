import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locker/src/style/theme.dart' as Style;

class BottomBarWidget extends StatefulWidget {
  final int _tabActive;
  BottomBarWidget(this._tabActive);
  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  String? type;
  @override
  Widget build(BuildContext context) {
    final Map<int, String> pagesOnTabs = {
      0: 'document',
      1: 'document',
      2: 'document',
      3: 'tracking',
    };
    return BottomNavigationBar(
      selectedIconTheme: IconThemeData(size: 23.0),
      iconSize: 18.0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      backgroundColor: Style.Colors.mainColor,
      currentIndex: widget._tabActive,
      // context.select((BottomNavigationBloc bloc) => bloc.currentIndex),
      onTap: (index) {
        // context.read<BottomNavigationBloc>().add(PageTapped(index: index));
        if (index == 1) {
          type = '2';
        } else if (index == 3) {
          type = '7';
        } else {
          type = 'transito';
        }
        Navigator.pushNamed(
          context,
          pagesOnTabs[index]!,
          arguments: {'type': type},
        );
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
      ],
    );
    // return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
    //   builder: (BuildContext context, BottomNavigationState state) {
    //   },
    // );
  }
}
