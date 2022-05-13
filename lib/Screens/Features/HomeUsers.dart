import 'package:flutter/material.dart';
import 'package:logins_screen/Components/BottomNavigationBar/bottom_navigation_users.dart';
import '../../../size_config.dart';
import 'HomePage/HomeUsersPage.dart';

class HomeUsers extends StatefulWidget {
  static String routeName = "/home_users";

  @override
  _HomeUsers createState() => _HomeUsers();
}

class _HomeUsers extends State<HomeUsers> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _selectedIndex;
  var lastIndex;
  var args;

  getCurrentPage(int index) {
    if (index == 0) {
      return HomeUsersPage();
    } else if (index == 1) {
      // return MenuPembelajaranSiswa();
    } else if (index == 2) {
      // return JadwalPelajaranSiswa();
      // return MenuKeuanganScreens();
    } else if (index == 3) {
      // return ProfileSiswaScreen();
    } else {}
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // Setting up AppBar
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          getCurrentPage(_selectedIndex),
        ],
      ),
      bottomNavigationBar:
          BottomNavigationUsers(_selectedIndex, onTabChange: (index) {
        _selectedIndex = index;
        setState(() {});
        if (_selectedIndex == 3 && _selectedIndex == lastIndex) {}
        lastIndex = index;
      }),
    );
  }
}
