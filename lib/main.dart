import 'package:flutter/material.dart';
import 'package:logins_screen/Screens/Login/LoginScreens.dart';
import 'package:logins_screen/routes.dart';
import 'package:logins_screen/theme.dart';


void main() async {

  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp]
  // ).then((_) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Toko Gitar',
    theme: theme(),
    initialRoute: LoginScreen.routeName,
    routes: routes,
  ));
  // });
}
