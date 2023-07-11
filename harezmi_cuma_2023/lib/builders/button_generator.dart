import 'package:flutter/material.dart';
import 'package:harezmi_cuma_2023/req.dart';

class CustomButtonCreator extends StatefulWidget {
  CustomButtonCreator(
      {super.key,
      required this.text,
      required this.backgroundColor,
      required this.borderColor,
      required this.width,
        this.height,
      this.func});
  String text;
  Color? backgroundColor;
  Color? borderColor;
  double width;
  double? height;
  void Function()? func;

  @override
  State<CustomButtonCreator> createState() => _CustomButtonCreatorState();
}

class _CustomButtonCreatorState extends State<CustomButtonCreator> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.func ?? () {},
      child: Container(
        decoration: BoxDecoration(
            color: widget.borderColor, borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.all(1),
        child: Container(
          child: Center(
            child: Text(
              widget.text,
              style: buttonFont,
            ),
          ),
          width: widget.width,
          height: widget.height ?? screenSize.width / 7.5,
          decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
