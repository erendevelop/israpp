import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harezmi_cuma_2023/req.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar("Menü"),
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                buildHeader("Çorbalar"),
                for(int i = 1; i <= corbalar.length; i++)
                  buildDishItem(i, corbalar),
                buildHeader("Ana yemekler"),
                for(int i = 1; i <= ana_yemekler.length; i++)
                  buildDishItem(i, ana_yemekler)
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildHeader(String title) => Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
          title,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.bold,
          color: textColor,
          fontSize: 17
        ),
      ),
    ),
  );
  Widget buildDefaultText(String content) => Text(
    content,
    style: GoogleFonts.inter(
        color: textColor,
    ),
  );
  Widget buildDishItem(int i, Map map){
    var screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.all(15),
        width: screenSize.width,
        height: screenSize.height / 10,
        decoration: BoxDecoration(
          color: i != randomGeneratedCorba ? mainTextFieldColor : Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildDefaultText(map["$i"]["isim"]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildDefaultText(map["$i"]["fiyat"].toString() + " ₺"),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        if(map["$i"]["asset"] == "assets/tick.png"){

                        }
                        else{
                          basket.addAll({
                            "${basket.length}" : {
                              "isim" : map["$i"]["isim"],
                              "fiyat" : map["$i"]["fiyat"],
                            },
                          });
                          setState(() => map["$i"]["asset"] = "assets/tick.png");
                        }
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Image.asset(map["$i"]["asset"], height: 10, width: 10, color: Colors.white,),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        )
    );
  }
}
