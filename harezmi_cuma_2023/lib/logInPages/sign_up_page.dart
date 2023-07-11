import 'package:flutter/material.dart';
import 'package:harezmi_cuma_2023/builders/button_generator.dart';
import 'package:harezmi_cuma_2023/builders/text_field_builder.dart';
import 'package:harezmi_cuma_2023/req.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  List controllers = [
    TextEditingController(),
    TextEditingController(),
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
                hintText: "Kullanıcı Adı", backgroundColor: mainTextFieldColor, controller: controllers[0],),
              TextFieldBuilder(
                  hintText: "E-mail", backgroundColor: mainTextFieldColor, controller: controllers[1],),
              TextFieldBuilder(
                  hintText: "Şifre", backgroundColor: mainTextFieldColor, controller: controllers[2],
              obscureText: true,),
              TextFieldBuilder(
                  hintText: "Yeniden Şifre", backgroundColor: mainTextFieldColor, controller: controllers[3],
              obscureText: true,),
              const SizedBox(height: 30),
              CustomButtonCreator(
                  text: "Kaydol",
                  backgroundColor: mainButtonColor,
                  borderColor: Colors.transparent,
                  width: mainButtonWidth(screenSize),
                  func: () {
                    if(controllers[2].text == controllers[3].text){
                      username = controllers[0].text;
                      mail = controllers[1].text;
                      password = controllers[2].text;
                      Navigator.pushNamed(context, "/main_page");
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

