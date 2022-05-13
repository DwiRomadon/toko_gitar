import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logins_screen/utils/constants.dart';

class BottomNavigationUsers extends StatefulWidget {
  var _currentIndex = 0;
  Function onTabChange;

  BottomNavigationUsers(this._currentIndex, {required this.onTabChange});

  @override
  _BottomNavigationUsers createState() => _BottomNavigationUsers();
}

class _BottomNavigationUsers extends State<BottomNavigationUsers> {
  // int _selectedIndex = 0;

  // var bottomTextStyle =
  // GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500);

  void _onItemTapped(int index) {
    setState(() {
      widget._currentIndex = index;
      widget.onTabChange(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: mFillColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 15,
              offset: Offset(0, 5))
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: widget._currentIndex == 0
                ? Icon(Icons.home, color: kPrimaryColor)
                : Icon(Icons.home),
            label: "Features"
          ),
          BottomNavigationBarItem(
            icon: widget._currentIndex == 1
                ? Icon(Icons.shopping_cart, color: kPrimaryColor)
                : Icon(Icons.shopping_cart),
              label: "Cart"
          ),
          BottomNavigationBarItem(
            icon: widget._currentIndex == 2
                ? Icon(Icons.star, color: kPrimaryColor)
                : Icon(Icons.star),
              label: "Favorite"
          ),
          BottomNavigationBarItem(
            icon: widget._currentIndex == 3
                ? Icon(Icons.person, color: kPrimaryColor)
                : Icon(Icons.person),
            label: "Akun"
          ),
        ],
        currentIndex: widget._currentIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: mSubtitleColor,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showUnselectedLabels: true,
        elevation: 0,
        showSelectedLabels: true,
      ),

      // child: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Colors.blueGrey,
      //   currentIndex: widget._currentIndex,
      //   onTap: _onItemTapped,
      //   // ignore: prefer_const_literals_to_create_immutables
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home,
      //         ),
      //         label: "Features"),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home,
      //         ),
      //         label: "Features"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.upload), label: "Post"),
      //     // BottomNavigationBarItem(icon: Icon(Icons.layers), label: "Item"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.person), label: "Accounts"),
      //   ],
      // ),
    );
  }
}
