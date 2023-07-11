import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harezmi_cuma_2023/req.dart';
import 'package:harezmi_cuma_2023/company/table_builder.dart';

import '../orderAlgortihm.dart';

class Tables extends StatefulWidget {
  const Tables({super.key});

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar("Masalar"),
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              for(int i = 1; i <= tables.length; i++)
                buildTable(i),
            ],
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
  Widget buildTable(int i){
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TableBuilder(tableNumber: i))),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.all(15),
          width: screenSize.width,
          height: screenSize.height / 10,
          decoration: BoxDecoration(
            color: mainTextFieldColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildDefaultText("Masa $i"),
                Image.asset("assets/right-arrows.png", color: Colors.white, width: 30, height: 30,)
              ],
            ),
          )
      ),
    );
  }
}
