import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harezmi_cuma_2023/builders/button_generator.dart';
import 'package:harezmi_cuma_2023/req.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Image.asset("assets/profile.png", color: assetColor, height: screenSize.width / 2, width: screenSize.width / 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        namesurname,
                        style: GoogleFonts.inter(
                            color: textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(mail, style: GoogleFonts.inter(
                          color: Colors.grey,
                          fontSize: 13
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButtonCreator(
                            text: "Profili Düzenle",
                            backgroundColor: mainButtonColor,
                            borderColor: Colors.transparent,
                            width: littleButtonWidth(screenSize),
                            height: 40,
                        ),
                      )
                    ],
                  ),
                  buildExpressedButton("Bildirimler"),
                  buildButton("Davet Linki"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget buildExpressedButton(String text){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                text,
                style: GoogleFonts.inter(
                    color: Colors.grey,
                    fontSize: 10
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: mainTextFieldColor,
            ),
            padding: EdgeInsets.all(10),
            child: ListTile(
              onTap: () => setState(() => switchValue = !switchValue),
              title: Text(
                "Bildirimleri aç",
                style: GoogleFonts.inter(
                    color: textColor,
                    fontWeight: FontWeight.bold
                ),
              ),
              trailing: CupertinoSwitch(
                  value: switchValue,
                  onChanged: (value){
                    setState(() => switchValue = value);
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildButton(String text){
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                text,
                style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: mainTextFieldColor,
            ),
            padding: EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                "Arkadaşını davet et",
                style: GoogleFonts.inter(
                    color: textColor,
                    fontWeight: FontWeight.bold
                ),
              ),
              trailing: Container(
                width: screenSize.width / 4,
                height: 40,
                child: Center(
                  child: Text(
                      "Davet et",
                    style: GoogleFonts.inter(
                      color: textColor,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30)
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
