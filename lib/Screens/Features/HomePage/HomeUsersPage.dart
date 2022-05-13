import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:logins_screen/Components/HomeUsers/HomeUsersScreeens.dart';
import 'package:logins_screen/Components/headers_for_home.dart';
import 'package:logins_screen/utils/constants.dart';

import '../../../../size_config.dart';
import '../../../Components/Login/LoginComponent.dart';
import '../../../Components/title_text.dart';

class HomeUsersPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: HeadersForHome("Toko Gitar"),
      ),
      body: HomeUserComponent()
    );
  }
}
