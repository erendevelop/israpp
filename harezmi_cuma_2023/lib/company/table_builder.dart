import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harezmi_cuma_2023/builders/button_generator.dart';
import 'package:harezmi_cuma_2023/req.dart';

import '../orderAlgortihm.dart';

class TableBuilder extends StatefulWidget {
  int tableNumber;
  TableBuilder({super.key, required this.tableNumber});

  @override
  State<TableBuilder> createState() => _TableBuilderState();
}

class _TableBuilderState extends State<TableBuilder> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar("Masa ${widget.tableNumber}"),
        backgroundColor: backgroundColor,
        body: !tables["${widget.tableNumber}"]["onTable"]
            ? Center(
                child: buildDefaultText("Masa boş."),
              )
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      buildTitle("Siparişler"),
                      for (int i = 1;
                          i <=
                              tables["${widget.tableNumber}"]["orders"]["names"]
                                  .length;
                          i++)
                        Container(
                          width: screenSize.width,
                          height: screenSize.height / 10,
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: mainTextFieldColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildDefaultText(tables["${widget.tableNumber}"]
                                  ["orders"]["names"][i - 1]),
                              buildDefaultText(tables["${widget.tableNumber}"]
                                          ["orders"]["prices"][i - 1]
                                      .toString() +
                                  " ₺")
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child: CustomButtonCreator(
            func: () {
              setState(() => coupons.add(
                  tables["${widget.tableNumber}"]["orders"]["fiyat"] / 100));
              showDialog(
                  context: context,
                  builder: (context) => buildDefaultText(coupons.toString()));
            },
            text: "Kupon tanımla",
            backgroundColor: mainButtonColor,
            borderColor: Colors.transparent,
            height: 55,
            width: mainButtonWidth(screenSize),
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
}
