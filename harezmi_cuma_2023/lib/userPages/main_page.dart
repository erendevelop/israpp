import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harezmi_cuma_2023/req.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  buildTitle("Merhaba, $username"),
                  buildQRScanMenu(),
                  // kuponlar kısmı
                  buildCoupon(),
                  buildCategories()
                ],
              ),
            ),
          ),
        ),
    );
  }
  Widget buildQRScanMenu(){
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/qr_scan"),
      child: Container(
        margin: EdgeInsets.all(20),
        width: screenSize.width,
        height: screenSize.height / 4.3,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white70,
            Colors.white24,
          ]),
          borderRadius: BorderRadius.circular(10)
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: ListTile(
            leading: Image.asset("assets/qr-code.png", height: 60, width: 60),
            title: Text(
              "QR kodu okutarak yemeğe başla!",
              style: GoogleFonts.inter(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCoupon() {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 20),
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              child: TabBar(
                physics: BouncingScrollPhysics(),
                indicatorPadding:
                    EdgeInsets.symmetric(vertical: screenSize.width / 70),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    child: Container(
                      child: Center(
                        child: Text("Kuponlar"),
                      ),
                      width: screenSize.width / 2,
                      height: screenSize.height / 10,
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Center(
                        child: Text("Sizin İçin"),
                      ),
                      width: screenSize.width / 2,
                      height: screenSize.height / 10,
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Center(
                        child: Text("Profil"),
                      ),
                      width: screenSize.width / 2,
                      height: screenSize.height / 10,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: screenSize.height / 4,
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: mainTextFieldColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: coupons.isEmpty ? Center(child: buildTitle("Kuponunuz yok."),
                    ) : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          buildTitle("Kuponlarınız"),
                          for(int i = 0; i < coupons.length; i++)
                            ListTile(
                              title: buildDefaultText("Kupon ${i+1}"),
                              trailing: buildDefaultText(coupons[i].toString()),
                            )
                        ],
                      ),
                    ),
                  ),
    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: mainTextFieldColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  "Seçilen yemek",
                                  style: GoogleFonts.inter(
                                    color: textColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                subtitle: Text(
                                    ana_yemekler["$randomGeneratedAnaYemek"]["isim"],
                                  style: GoogleFonts.inter(
                                    color: textColor,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Seçilen çorba",
                                  style: GoogleFonts.inter(
                                    color: textColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                subtitle: Text(
                                  corbalar["$randomGeneratedCorba"]["isim"],
                                  style: GoogleFonts.inter(
                                    color: textColor,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                      ),
                    ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/profile_page"),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: mainTextFieldColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(image: AssetImage("assets/profile.png"), height: 100, width: 100, color: Colors.white,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    namesurname,
                                    style: GoogleFonts.inter(
                                      fontSize: 20,
                                      color: textColor,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                      mail,
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      color: textColor,
                                    ),
                                  ),
                                ],
                              )
                            ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategories() {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        buildTitle("Seçenekler"),
        for (int i = 0; i < 2; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int j = 0; j < 2; j++)
                  GestureDetector(
                    onTap: i*j == 1 ? () => Navigator.pushNamed(context, "/menu") : i == 0 && j == 1 ? () => Navigator.pushNamed(context, "/basket") : i == 0 && j == 0 ? () => Navigator.pushNamed(context, "/my_orders") : null,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: mainTextFieldColor
                      ),
                          width: screenSize.width / 2.65,
                          height: screenSize.width / 2.65,
                          child: i == 0
                              ? j == 0
                                  ? buildCategoryBox(AssetImage("assets/delivery-truck.png"), Colors.blue, "Siparişlerim")
                                  : buildCategoryBox(AssetImage("assets/cart.png"), Colors.deepOrangeAccent, "Sepetim")
                              : j == 0
                                  ? buildCategoryBox(AssetImage("assets/market.png"), Colors.teal, "Önceki\nSiparişler")
                                  : buildCategoryBox(AssetImage("assets/menu.png"), Colors.red, "Menü"),
                          ),
                  ),
              ],
            ),
          )
      ],
    );
  }
  Widget buildCategoryBox(AssetImage icon, Color? color, String text){
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              child: buildIcon(icon, color),
              alignment: Alignment.topLeft,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                text,
                style: GoogleFonts.inter(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
    );
  }
  Widget buildTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Text(
          text,
          style: GoogleFonts.inter(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  Widget buildDefaultText(String content) => Text(
    content,
    style: GoogleFonts.inter(
      color: textColor,
    ),
  );
  Widget buildIcon(AssetImage icon, Color? color){
    return Container(
      child: Center(child: Image(image: icon, color: Colors.white, height: 21, width: 21,)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      width: 45,
      height: 45,
    );
  }
}
