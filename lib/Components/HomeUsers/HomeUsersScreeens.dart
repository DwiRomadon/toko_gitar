import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:logins_screen/Components/extentions.dart';
import 'package:logins_screen/Components/title_text.dart';
import 'package:logins_screen/Screens/Features/DetailProduct/DetailScreens.dart';
import 'package:logins_screen/theme.dart';
import '../../utils/constants.dart';

class HomeUserComponent extends StatefulWidget {
  @override
  _HomeUserComponent createState() => _HomeUserComponent();
}

class _HomeUserComponent extends State<HomeUserComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: MediaQuery.of(context).size.height - 100,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 25),
            _title(),
            SizedBox(
              height: 10,
            ),
            _search(),
            Container(
              padding: EdgeInsets.only(left: 15, top: 15),
              child: TitleText(text: "Kategori Produk", fontSize: 14),
            ),
            _categoryWidget(),
            Container(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15),
              child: Row(
                children: [
                  TitleText(text: "Produk", fontSize: 14),
                  Spacer(),
                  TitleText(text: "Lihat Semua", fontSize: 14)
                ],
              ),
            ),
            _productWidget(),
            // Container(
            //   padding: EdgeInsets.only(left: 15, top: 15),
            //   child: TitleText(text: "Terlaris", fontSize: 14),
            // ),
            // _productBestSellWidget()
            // _categoryWidget(),
            // _productWidget(),
          ],
        ),
      ),
    ));
  }

  _title() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                TitleText(
                  text: 'Produk',
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
                TitleText(
                  text: 'Kami',
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            Spacer(),
            SizedBox()
          ],
        ));
  }

  Widget _search() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: lightGrey.withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Cari Produk",
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: Colors.black54)),
              ),
            ),
          ),
          SizedBox(width: 20),
          _icon(Icons.filter_list, color: Colors.black54)
        ],
      ),
    );
  }

  Widget _icon(IconData icon, {Color color = iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: Colors.white,
          boxShadow: shadow),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _categoryWidget() {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      width: fullWidth(context),
      height: 80,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        _categoryCard("assets/images/ibanez_01.png", "Ibanez", true),
        _categoryCard("assets/images/fender_01.jpeg", "Fender", false),
        _categoryCard("assets/images/gibson_01.jpg", "Gibson", false),
      ]),
    );
  }

  _categoryCard(img, name, bool isSelected) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: isSelected ? background : Colors.transparent,
            border: Border.all(
              color: isSelected ? kPrimaryColor : kThirdColor,
              width: isSelected ? 2 : 1,
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: isSelected ? Color(0xfffbf2ef) : Colors.white,
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Image.asset(img, width: 100),
              Container(
                child: TitleText(
                  text: name,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              )
            ],
          ),
        )).ripple(() {
      setState(() {
        isSelected = true;
      });
    });
  }

  Widget _productWidget() {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      width: fullWidth(context),
      height: fullWidth(context),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 20
        ),
        padding: EdgeInsets.only(left: 20, right: 20),
        scrollDirection: Axis.vertical,
        children: [
          _productCard("Ibanez RG", "assets/images/ibanez_product.jpg",
              "Ibanez", "Rp 10.000.000", true),
          _productCard(
              "Ibanez Jump Start",
              "assets/images/ibanez_product_02.png",
              "Ibanez",
              "Rp 25.000.000",
              false),
          _productCard("Ibanez AZS", "assets/images/ibanez_product03.png",
              "Ibanez", "Rp 20.000.000", false),
        ],
      ),
    );
  }

  _productCard(name, image, category, price, bool isliked) {
    return GestureDetector(
      onTap: () {
          Navigator.pushNamed(context, DetailProductscreens.routeName);
      },
      child: Container(
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
            ],
          ),
          margin: EdgeInsets.only(top: 20),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  left: 0,
                  top: 0,
                  child: IconButton(
                    icon: Icon(
                      isliked ? Icons.favorite : Icons.favorite_border,
                      color: isliked ? kColorRedSlow : iconColor,
                    ),
                    onPressed: () {},
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 15),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: kPrimaryColor.withAlpha(40),
                          ),
                          Image.asset(image)
                        ],
                      ),
                    ),
                    // SizedBox(height: 5),
                    TitleText(
                      text: name,
                      fontSize: 16,
                    ),
                    TitleText(
                      text: category,
                      fontSize: 14,
                      color: kPrimaryColor,
                    ),
                    TitleText(
                      text: price.toString(),
                      fontSize: 18,
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget _productBestSellWidget() {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      width: fullWidth(context),
      height: fullWidth(context) * .7,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10
        ),
        padding: EdgeInsets.only(left: 20),
        scrollDirection: Axis.vertical,
        children: [
          _productBestSellCard("Ibanez RG", "assets/images/ibanez_product.jpg",
              "Ibanez", "Rp 10.000.000", true),
          _productBestSellCard(
              "Gibson Les Paul",
              "assets/images/gibson_01.jpg",
              "Ibanez",
              "Rp 25.000.000",
              false),
          _productBestSellCard(
              "Fender",
              "assets/images/fender_01.jpeg",
              "Fender",
              "Rp 25.000.000",
              false),
        ],
      ),
    );
  }

  _productBestSellCard(name, image, category, price, bool isliked) {
    return Container(
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 15),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: kPrimaryColor.withAlpha(40),
                        ),
                        Image.asset(image)
                      ],
                    ),
                  ),
                  // SizedBox(height: 5),
                  TitleText(
                    text: name,
                    fontSize: 16,
                  ),
                  SizedBox(height: 5,),
                  TitleText(
                    text: category,
                    fontSize: 14,
                    color: kPrimaryColor,
                  ),
                  SizedBox(height: 5,),
                  TitleText(
                    text: price.toString(),
                    fontSize:18,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
