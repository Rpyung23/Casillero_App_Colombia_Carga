import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locker/src/bloc/auth_bloc/auth.dart';
// import 'package:locker/src/repositories/users.dart';
import 'package:locker/src/style/theme.dart' as Style;

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({Key? key}) : super(key: key);
  // final loggedUser = UserRepository().getLoggedUser();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Style.Colors.mainColor,
      elevation: 1,
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset(
            'assets/logo.ico',
            alignment: Alignment.center,
            repeat: ImageRepeat.noRepeat,
            scale: 2.2,
          ),
        ),
      ),
      // title: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text(
      //       loggedUser.toString() ?? ' vacío',
      //       style: TextStyle(
      //         color: Style.Colors.titleColor,
      //         fontSize: 20.0,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     Text(
      //       '10411 NW 28 St Suite C102',
      //       style: TextStyle(
      //         color: Style.Colors.elementBack,
      //         fontSize: 15.0,
      //       ),
      //     ),
      //   ],
      // ),
      actions: [
        IconButton(
          icon: Icon(FontAwesomeIcons.lightSignOutAlt),
          onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context).add(
              LoggedOut(),
            );
            Navigator.of(context).pushNamed('login');
          },
        )
      ],
    );
  }
}
