import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
bool switchValue = false;
Color? textColor = Colors.white;
Color? mainTextFieldColor = Color.fromARGB(255, 42, 41, 41);
Color? assetColor = Colors.white;
Color? backgroundColor = Colors.black;
Color? mainButtonColor = Colors.blue;
Color? secondaryButtonColor = Colors.black87;
TextStyle textFieldFont = GoogleFonts.inter(color: Colors.grey);
TextStyle buttonFont = GoogleFonts.inter(
    fontWeight: FontWeight.bold, color: textColor, fontSize: 14);

double littleButtonWidth(Size screenSize) {
  return screenSize.width / 2.5;
}

double mainButtonWidth(Size screenSize) {
  return screenSize.width;
}
bool isOnTable = false;

String username = "user";
String password = "123";
String namesurname = "Ad Soyad";
String mail = "kişi123@gmail.com";
var rng = Random.secure();
int randomGeneratedAnaYemek = rng.nextInt(3) + 1;
int randomGeneratedCorba = rng.nextInt(3) + 1;
Map basket = {};
Map personalOrders = {};
Map ana_yemekler = {
  "1" : {
    "isim" : "Urfa kebap",
    "fiyat" : 180.0,
    "asset" : "assets/plus.png",
  },
  "2" : {
    "isim" : "Adana kebap",
    "fiyat" : 180.0,
    "asset" : "assets/plus.png",
  },
  "3" : {
    "isim" : "İskender",
    "fiyat" : 160.0,
    "asset" : "assets/plus.png",
  },
  "4" : {
    "isim" : "Patlıcan oturtma",
    "fiyat" : 180.0,
    "asset" : "assets/plus.png",
  },
  "5" : {
    "isim" : "Güveç",
    "fiyat" : 180.0,
    "asset" : "assets/plus.png",
  },
};
Map corbalar = {
  "1" : {
    "isim" : "Kellepaça",
    "fiyat" : 40.0,
    "asset" : "assets/plus.png",
  },
  "2" : {
    "isim" : "Mercimek",
    "fiyat" : 40.0,
    "asset" : "assets/plus.png",
  },
  "3" : {
    "isim" : "Ezogelin",
    "fiyat" : 45.0,
    "asset" : "assets/plus.png",
  },
  "4" : {
    "isim" : "Yayla çorbası",
    "fiyat" : 43.0,
    "asset" : "assets/plus.png",
  },
  "5" : {
    "isim" : "Domates çorbası",
    "fiyat" : 43.0,
    "asset" : "assets/plus.png",
  },
};
List yemekler = [corbalar, ana_yemekler];
List coupons = [];

AppBar customAppBar(String title){
  return AppBar(
    leading: Builder(
      builder: (context) => Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            child: Center(child: Image.asset("assets/back.png", color: Colors.white, width: 13, height: 13,)),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: mainTextFieldColor,
              borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(
        title,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: textColor
      ),
    ),
  );
}