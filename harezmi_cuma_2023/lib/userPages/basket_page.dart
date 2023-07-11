import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harezmi_cuma_2023/builders/button_generator.dart';
import 'package:harezmi_cuma_2023/orderAlgortihm.dart';
import 'package:harezmi_cuma_2023/req.dart';

class Basket extends StatefulWidget {
  const Basket({super.key});

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: customAppBar("Sepetim"),
      body: basket.isEmpty ? Center(child: buildDefaultText("Sepetiniz boş."),
      ):  SingleChildScrollView(
        child: Column(
          children: [
            for(int i = 0; i < basket.length; i++)
              buildProduct(i),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomButtonCreator(
                text: "Sipariş ver",
                backgroundColor: mainButtonColor,
                borderColor: Colors.transparent,
                width: mainButtonWidth(screenSize),
                func: isOnTable ? () {
                  personalOrders = basket;
                  showDialog(context: context, builder: (context) => AlertDialog(
                    content: buildDefaultText("Siparişiniz alınmıştır."),
                    backgroundColor: backgroundColor,
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Tamam",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: mainButtonColor,
                          ),
                        ),
                      )
                    ],
                  ));
                  for(int i = 1; i <= tables.length; i++){
                    if(tables["$i"]["onTable"]){
                      for(int j = 0; j < basket.length; j++){
                        tables["$i"]["orders"]["names"].add(basket["$j"]["isim"]);
                        tables["$i"]["orders"]["prices"].add(basket["$j"]["fiyat"]);
                      }
                      break;
                    }
                  }
                }: () {
                  showDialog(context: context, builder: (context) => AlertDialog(
                    content: buildDefaultText("Lütfen bir masa seçin."),
                    backgroundColor: backgroundColor,
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Tamam",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: mainButtonColor,
                          ),
                        ),
                      )
                    ],
                  ));
                }
              ),
            ),
          ],
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
  Widget buildProduct(int i){
    var screenSize = MediaQuery.of(context).size;
    return Container(
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
              buildDefaultText(basket["$i"]["isim"]),
              buildDefaultText(basket["$i"]["fiyat"].toString() + " ₺"),
            ],
          ),
        ),
    );
  }
}
