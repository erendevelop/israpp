import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harezmi_cuma_2023/req.dart';
import 'package:harezmi_cuma_2023/company/tables.dart';

class CompanyMainPage extends StatefulWidget {
  const CompanyMainPage({super.key});

  @override
  State<CompanyMainPage> createState() => _CompanyMainPageState();
}

class _CompanyMainPageState extends State<CompanyMainPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
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
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/tables"),
                    child: Container(
                      width: screenSize.width,
                      height: screenSize.height / 4,
                      padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: mainTextFieldColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                            "Masaları görüntüleyin",
                          style: GoogleFonts.inter(
                            color: textColor,
                            fontSize: 23,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ),
                  ),
                  // kuponlar kısmı
                  buildCategories()
                ],
              ),
            ),
          ),
        ),
    );
  }

  Widget buildCategories() {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        buildTitle("Seçenekler"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < 2; i++)
                  GestureDetector(
                    onTap: i == 1 ? () => Navigator.pushNamed(context, "/menu") : () => Navigator.pushNamed(context, "/basket"),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: mainTextFieldColor
                      ),
                      width: screenSize.width / 2.65,
                      height: screenSize.width / 2.65,
                      child: i == 0 ? buildCategoryBox(AssetImage("assets/delivery-truck.png"), Colors.blue, "Bekleyen\nSiparişler")
                          : buildCategoryBox(AssetImage("assets/company.png"), Colors.deepOrangeAccent, "Şirketiniz")
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

