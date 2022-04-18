import 'package:flutter/cupertino.dart';
import 'package:logins_screen/Screens/Login/LoginScreens.dart';

import 'Screens/Registrasi/RegistrasiScreens.dart';


final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  RegistrasiScreen.routeName: (context) => RegistrasiScreen(),
};
