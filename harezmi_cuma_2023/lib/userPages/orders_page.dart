import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harezmi_cuma_2023/req.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: customAppBar("Siparişlerim"),
      body: personalOrders.isEmpty ? Center(child: buildDefaultText("Henüz sipariş vermemişsiniz."),
      ):  SingleChildScrollView(
        child: Column(
          children: [
            for(int i = 0; i < personalOrders.length; i++)
              buildProduct(i),
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
            buildDefaultText(personalOrders["$i"]["isim"]),
            buildDefaultText(personalOrders["$i"]["fiyat"].toString()),
          ],
        ),
      ),
    );
  }
}
