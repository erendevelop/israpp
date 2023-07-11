import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harezmi_cuma_2023/builders/button_generator.dart';
import 'package:harezmi_cuma_2023/req.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var loginImageSize = screenSize.width / 1.5;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: loginImageSize,
                height: loginImageSize,
                child: Image.asset("assets/logo.png"),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "Hoş Geldin!",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          fontSize: 36,
                        ),
                      ),
                    ),
                    Text(
                      "Yemek israfına hayır de! IsrApp uygulamamız ile israf etme, sen de kazan.",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buildButtons()
            // Hoş geldin yazıları
          ]),
        ),
      ),
    );
  }

  Widget buildButtons() {
    var screenSize = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            CustomButtonCreator(
              text: "E-Posta ile Giriş Yap",
              backgroundColor: mainButtonColor,
              width: screenSize.width,
              borderColor: Colors.transparent,
              func: () => Navigator.pushNamed(context, "/mail_login"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButtonCreator(
                          text: "Kaydol",
                          backgroundColor: secondaryButtonColor,
                          width: littleButtonWidth(screenSize),
                          borderColor: Colors.grey,
                          func: () => Navigator.pushNamed(
                              context, "/kaydol")),
                        CustomButtonCreator(
                          borderColor: Colors.grey,
                          text: "Firma Girişi",
                          backgroundColor: secondaryButtonColor,
                          width: littleButtonWidth(screenSize),
                          func: () => Navigator.pushNamed(context, "/company_main"),
                        ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
