
import 'package:flutter/material.dart';
import 'package:logins_screen/Components/DetailProduct/DetailProductComponents.dart';

import '../../../../size_config.dart';
import '../../../Components/headers_for_sub_menu.dart';

class DetailProductscreens extends StatelessWidget {
  static String routeName = "/detail_product";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: HeadersForSubMenu("Detail Product"),
        ),
        body: ProductDetailComponent()
    );
  }
}
