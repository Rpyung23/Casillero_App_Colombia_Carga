import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:locker/src/bloc/login_bloc/login_bloc.dart';
import 'package:locker/src/repositories/firebase_messaging.dart';
import 'package:locker/src/repositories/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locker/src/style/custom.dart';
import 'package:locker/src/style/theme.dart' as Style;
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:toast/toast.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;
  LoginForm({Key? key, required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState(userRepository);
}

class _LoginFormState extends State<LoginForm> {
  final UserRepository userRepository;
  _LoginFormState(this.userRepository);
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 5.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _titleForm(),
              SizedBox(height: 20.0),
              _emailInput(),
              SizedBox(height: 20.0),
              _passwordInput(),
              SizedBox(height: 10.0),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: new InkWell(
              //       child: new Text(
              //         "Olvidé mi contraseña",
              //         style: TextStyle(
              //             color: Colors.black45, fontSize: 12.0),
              //       ),
              //       onTap: () {}),
              // ),
              _buttonLogin(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       "O puede usar",
              //       style:
              //           TextStyle(color: Colors.black26, fontSize: 12.0),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 20.0),
              // _buttonsLoginOtions(),
              SizedBox(height: 10.0),
              Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  color: Colors.black,
                )),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Registrate",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Divider(
                  color: Colors.black,
                )),
              ]),

              // _registerSection(),
              // SizedBox(height: 20.0)
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /*SocialLoginButton(
                          buttonType: SocialLoginButtonType.facebook,
                          height: 40,
                          width: 53,
                          imageWidth: 21,
                          text: '',
                          mode: SocialLoginButtonMode.single,
                          onPressed: () {
                            signInWithFacebook();
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),*/
                        SocialLoginButton(
                          buttonType: SocialLoginButtonType.google,
                          height: 40,
                          width: 53,
                          imageWidth: 21,
                          text: '',
                          mode: SocialLoginButtonMode.single,
                          onPressed: () {
                            signInWithGoogle();
                          },
                        )
                      ],
                    ) /*,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: CircleAvatar(
                            child: Icon(FontAwesomeIcons.facebookF),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          onTap: () {
                            signInWithFacebook();
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: CircleAvatar(
                            child: Icon(FontAwesomeIcons.google),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                          ),
                          onTap: () {
                            //LOGIN GOOGLE
                            signInWithGoogle();
                          },
                        )
                      ],
                    )*/
                    ,
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text("No es un miembro? "),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'register');
                            },
                            style: TextButton.styleFrom(
                                shadowColor: Colors.white,
                                surfaceTintColor: Colors.white,
                                foregroundColor: Colors.white),
                            child: Text(
                              "Registrate ahora",
                              style: TextStyle(
                                  color: Style.Colors.mainColor,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleForm() {
    return Container(
      height: 100.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo_big.png', height: 50.0),
          // SizedBox(
          //   height: 10.0,
          // ),
          // Text(
          //   "MI CASILLERO",
          //   style: TextStyle(
          //     color: Style.Colors.mainColor,
          //     fontWeight: FontWeight.w800,
          //     fontSize: 25.0,
          //   ),
          // ),
          // SizedBox(
          //   height: 5.0,
          // ),
          // Text(
          //   "Administra tus paquetes",
          //   style: TextStyle(fontSize: 15.0, color: Colors.black38),
          // )
        ],
      ),
    );
  }

  Widget _emailInput() {
    return TextFormField(
      controller: _usernameController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'El correo es obigatorio';
        }
        return null;
      },
      style: TextStyle(
        fontSize: 15.0,
        color: Style.Colors.titleColor,
        // fontWeight: FontWeight.bold,
      ),
      decoration: styleInput('Correo', FontAwesomeIcons.envelope),
      autocorrect: false,
    );
  }

  Widget _passwordInput() {
    return TextFormField(
      controller: _passwordController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'La contraseña es obigatoria';
        }
        return null;
      },
      style: TextStyle(
          fontSize: 15.0,
          color: Style.Colors.titleColor,
          fontWeight: FontWeight.bold),
      decoration: styleInput('Contraseña', FontAwesomeIcons.lock),
      autocorrect: false,
      obscureText: true,
    );
  }

  Widget _buttonLogin() {
    return Padding(
      padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(15.0),
              primary: Style.Colors.mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                print("EMAIL : " + _usernameController.value.text);
                print("PASS : " + _passwordController.value.text);
                int code = await widget.userRepository.loginv2(
                    _usernameController.value.text,
                    _passwordController.value.text);

                if (code == 200) {
                  Navigator.of(context).pushNamed('home');
                }
              }
            },
            child: Text(
              "ENTRAR",
              style: new TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  // Widget _buttonsLoginOtions() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Container(
  //         height: 40.0,
  //         width: 150.0,
  //         child: ElevatedButton(
  //             // color: Color(0xFF385c8e),
  //             // disabledColor: Style.Colors.mainColor,
  //             // shape: RoundedRectangleBorder(
  //             //   borderRadius: BorderRadius.circular(8.0),
  //             // ),
  //             // disabledTextColor: Colors.white,
  //             onPressed: _onLoginButtonPressed,
  //             // onPressed: () {},
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Icon(
  //                   EvaIcons.facebook,
  //                   color: Colors.white,
  //                 ),
  //                 SizedBox(
  //                   width: 5.0,
  //                 ),
  //                 Text("Facebook",
  //                     style: new TextStyle(
  //                         fontSize: 12.0,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.white)),
  //               ],
  //             )),
  //       ),
  //       Container(
  //         width: 150.0,
  //         height: 40.0,
  //         child: ElevatedButton(
  //             // color: Color(0xFFf14436),
  //             // disabledColor: Style.Colors.mainColor,
  //             // disabledTextColor: Colors.white,
  //             // shape: RoundedRectangleBorder(
  //             //   borderRadius: BorderRadius.circular(8.0),
  //             // ),
  //             onPressed: () {},
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Icon(
  //                   EvaIcons.google,
  //                   color: Colors.white,
  //                 ),
  //                 SizedBox(
  //                   width: 5.0,
  //                 ),
  //                 Text("Google",
  //                     style: new TextStyle(
  //                         fontSize: 12.0,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.white)),
  //               ],
  //             )),
  //       ),
  //     ],
  //   );
  // }

  // Widget _registerSection() {
  //   return Align(
  //     alignment: Alignment.bottomCenter,
  //     child: Container(
  //         padding: EdgeInsets.only(bottom: 30.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: <Widget>[
  //             Text(
  //               "¿No tienes una cuenta?",
  //               style: TextStyle(color: Style.Colors.grey),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.only(right: 5.0),
  //             ),
  //             GestureDetector(
  //               onTap: () {},
  //               child: Text(
  //                 "Registrate aquí",
  //                 style: TextStyle(
  //                     color: Style.Colors.mainColor,
  //                     fontWeight: FontWeight.bold),
  //               ),
  //             )
  //           ],
  //         )),
  //   );
  // }

  Widget _showLoading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25.0,
              width: 25.0,
              child: CupertinoActivityIndicator(),
            )
          ],
        ))
      ],
    );
  }

  Future<void> signInWithGoogle() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    var token = googleAuth!.accessToken;
    var idtoken = googleAuth!.idToken;

    print("ACESS TOKEN GOOGLE : " + token!);
    print("ID TOKEN GOOGLE : " + idtoken!);

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    //await FirebaseAuth.instance.signOut();

    // Once signed in, return the UserCredential
    UserCredential oU =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print("UserCredential UID : " + oU.user!.uid);
    print("UserCredential EMAIL : " + oU.user!.email!);
    print("UserCredential NAMES : " + oU.user!.displayName!);

    /**VERIFICANDO EMAIL GMAIL***/

    var code = await userRepository.checkEmail(oU.user!.email!);

    if (code.code != 200) {
      /** REGISTRAR EMAIL **/
      var codeRegister = await userRepository.registerUsuarioSocial(
          oU.user!.email!, oU.user!.uid!, oU.user!.displayName!);
      if (codeRegister.code == 200) {
        userRepository.persistData(codeRegister.data!.accessToken);
        Navigator.of(context).pushNamed('home');
      } else {
        Toast.show(
            (codeRegister.message == null
                ? "ERROR DESCONOCIDO BACKEND"
                : codeRegister.message!),
            duration: Toast.lengthLong,
            gravity: Toast.center,
            backgroundColor: Colors.redAccent,
            textStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w700));
      }
    } else {
      print("ID USER : " + code.data!.id.toString());
      userRepository.persistUserId(code.data!.id.toString());
      userRepository.persistToken(code.accessToken);
      Navigator.of(context).pushNamed('home');
    }

    //return oU;
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
