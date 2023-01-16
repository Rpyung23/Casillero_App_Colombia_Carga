// PACKNAME ORIGINAL ANDROID : com.casillero.locker.cargacolombia
// PACKNAME ORIGINAL IOS com.casillero.locker.cargacolombia
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:locker/onesignal.dart';
import 'package:locker/src/bloc/document_bloc/document_bloc.dart';
import 'package:locker/src/repositories/notifications_local.dart';
import 'package:locker/src/repositories/push_notifications_service.dart';
import 'package:locker/src/routes/routes.dart';
import 'src/bloc/auth_bloc/auth.dart';
import 'src/bloc/auth_bloc/auth_bloc.dart';
import 'src/repositories/users.dart';
// import 'package:locker/src/pages/auth/login_page.dart';
// import 'package:locker/src/pages/home/home_page.dart';
// import 'package:locker/src/style/theme.dart' as Style;

String initRoute = "login";

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await PushNotificationServices.initializeApp();
  await initNotificationsLocal();
  final storage = new FlutterSecureStorage();
  String? value = await storage.read(key: 'isOnBoarding');
  print("IS ONBOARDING : $value");
  initRoute = (value == '1' ? 'login' : 'onboarding');

  if (initRoute == 'login') {
    if (await UserRepository.hasToken()) {
      initRoute = 'home';
      //initRoute = 'city';
      //initRoute = 'register';
    }
  }

  print("IS initRoute : $initRoute");
  runApp(AppState());
}

class AppState extends StatelessWidget {
  final userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(userRepository: userRepository)
              ..add(AppStarted());
          },
        ),
        BlocProvider(create: (_) => DocumentBloc())
      ],
      child: MyApp(userRepository: userRepository),
    );
  }
}

class MyApp extends StatefulWidget {
  final UserRepository userRepository;

  MyApp({Key? key, required this.userRepository}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    //PushNotificationService.initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('es', 'ES'),
      theme: ThemeData(fontFamily: 'Exo'),
      routes: getAppRoutes(),
      initialRoute: initRoute,
    );
  }
}
