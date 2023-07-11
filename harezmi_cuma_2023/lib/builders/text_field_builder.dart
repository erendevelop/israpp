import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harezmi_cuma_2023/req.dart';

class TextFieldBuilder extends StatefulWidget {
  String hintText;
  Color? backgroundColor;
  TextEditingController? controller;
  bool? obscureText;
  TextFieldBuilder({super.key, required this.hintText, this.backgroundColor, this.controller, this.obscureText});

  @override
  State<TextFieldBuilder> createState() => _TextFieldBuilderState();
}

class _TextFieldBuilderState extends State<TextFieldBuilder> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(10),
      width: screenSize.width / 1.5,
      height: screenSize.width / 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.backgroundColor ?? Colors.grey,
      ),
      child: TextField(
        obscureText: widget.obscureText ?? false,
        controller: widget.controller ?? null,
        style: textFieldFont,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          hintText: widget.hintText,
          border: InputBorder.none,
          hintStyle: textFieldFont,
        ),
      ),
    );
  }
}
