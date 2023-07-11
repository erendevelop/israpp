import 'package:flutter/material.dart';
import 'package:harezmi_cuma_2023/company/companyMain.dart';
import 'package:harezmi_cuma_2023/logInPages/google_sign_in.dart';
import 'package:harezmi_cuma_2023/logInPages/login_page.dart';
import 'package:harezmi_cuma_2023/logInPages/mail_sign_in.dart';
import 'package:harezmi_cuma_2023/logInPages/sign_up_page.dart';
import 'package:harezmi_cuma_2023/userPages/main_page.dart';
import 'package:harezmi_cuma_2023/userPages/menu.dart';
import 'package:harezmi_cuma_2023/userPages/orders_page.dart';
import 'package:harezmi_cuma_2023/userPages/profilePage.dart';
import 'package:harezmi_cuma_2023/userPages/qr_scanner.dart';
import 'package:harezmi_cuma_2023/company/tables.dart';

import 'userPages/basket_page.dart';

void main() => runApp(IsrApp());

class IsrApp extends StatelessWidget {
  const IsrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/mail_login": (context) => MailLogin(),
        "/google_login": (context) => GoogleLogin(),
        "/main_page": (context) => MainPage(),
        "/qr_scan" : (context) => QrCodeScannerPage(),
        "/profile_page" : (context) => ProfilePage(),
        "/menu" : (context) => Menu(),
        "/basket" : (context) => Basket(),
        "/company_main" : (context) => CompanyMainPage(),
        "/tables" : (context) => Tables(),
        "/my_orders" : (context) => OrdersPage(),
        "/kaydol" : (context) => SignUpPage(),
      },
      home: LoginPage(),
    );
  }
}
