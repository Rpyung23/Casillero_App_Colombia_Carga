import 'package:locker/src/bloc/auth_bloc/auth.dart';
import 'package:locker/src/bloc/login_bloc/login_bloc.dart';
import 'package:locker/src/repositories/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
            // fit: BoxFit.fitHeight,
            // colorFilter: new ColorFilter.mode(
            //   Colors.black.withOpacity(0.2),
            //   BlendMode.dstATop,
            // ),
          ),
        ),
        child: Container(
          // color: Colors.white,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            // boxShadow: [
            //   BoxShadow(color: Colors.green, spreadRadius: 3),
            // ],
          ),
          child: BlocProvider(
            create: (context) {
              return LoginBloc(
                authenticationBloc:
                    BlocProvider.of<AuthenticationBloc>(context),
                userRepository: userRepository,
              );
            },
            child: LoginForm(
              userRepository: userRepository,
            ),
          ),
        ),
      ),
    );
  }
}
