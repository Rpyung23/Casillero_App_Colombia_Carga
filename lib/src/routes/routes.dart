import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locker/src/bloc/auth_bloc/auth.dart';
import 'package:locker/src/pages/auth/login_page.dart';
import 'package:locker/src/pages/auth/register_page.dart';
import 'package:locker/src/pages/city/city_page.dart';
import 'package:locker/src/pages/document/document_page.dart';
import 'package:locker/src/pages/home/home_page.dart';
import 'package:locker/src/pages/onboarding/onboarding.dart';
import 'package:locker/src/pages/profile/profile_page.dart';
import 'package:locker/src/pages/tracking/tracking_page.dart';
import 'package:locker/src/repositories/users.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  final userRepository = UserRepository();
  return <String, WidgetBuilder>{
    '/': (context) => BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationAuthenticated) {
              return HomePage();
            } else if (state is AuthenticationUnauthenticated) {
              return LoginPage(userRepository: userRepository);
            } else {
              return Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
          },
        ),
    'home': (context) => HomePage(),
    'profile': (context) => ProfilePage(),
    'onboarding': (context) => OnBoarding(),
    'register': (context) => RegisterPage(),
    'login': (context) => LoginPage(userRepository: userRepository),
    'city': (context) => CityPage(),
  };
}
