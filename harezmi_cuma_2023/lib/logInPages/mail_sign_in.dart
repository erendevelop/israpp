import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harezmi_cuma_2023/builders/button_generator.dart';
import 'package:harezmi_cuma_2023/builders/text_field_builder.dart';
import 'package:harezmi_cuma_2023/req.dart';

class MailLogin extends StatefulWidget {
  const MailLogin({super.key});

  @override
  State<MailLogin> createState() => _MailLoginState();
}

class _MailLoginState extends State<MailLogin> {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
  ];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFieldBuilder(
                  hintText: "E-mail", backgroundColor: mainTextFieldColor, controller: controllers[0],),
              TextFieldBuilder(
                  hintText: "Şifre", backgroundColor: mainTextFieldColor, obscureText: true, controller: controllers[1],),
              const SizedBox(height: 30),
              CustomButtonCreator(
                  text: "Giriş Yap",
                  backgroundColor: mainButtonColor,
                  borderColor: Colors.transparent,
                  width: mainButtonWidth(screenSize),
                  func: () {
                    if(controllers[0].text == mail && controllers[1].text == password){
                      Navigator.pushNamed(context, "/main_page");
                    }
                  }
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "Hesabınız yok mu?",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold, color: textColor),
                ),
              ),
              CustomButtonCreator(
                backgroundColor: secondaryButtonColor,
                borderColor: Colors.grey,
                text: "Kaydol",
                func: () => Navigator.pushNamed(context, "/kaydol"),
                width: littleButtonWidth(screenSize),
              )
            ],
          ),
        ),
      ),
    );
  }
}
