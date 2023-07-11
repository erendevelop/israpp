import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harezmi_cuma_2023/orderAlgortihm.dart';
import 'package:harezmi_cuma_2023/req.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScannerPage extends StatefulWidget {
  const QrCodeScannerPage({Key? key}) : super(key: key);

  @override
  State<QrCodeScannerPage> createState() => _QrCodeScannerPageState();
}

class _QrCodeScannerPageState extends State<QrCodeScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  Barcode? result;
  QRViewController? controller;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
              width: screenSize.width,
                  height: screenSize.height,
                  child: QRView(
                    overlay: QrScannerOverlayShape(borderRadius: 10, borderColor: Colors.blue),
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                ),
            ],
          ),
        ),
    );
  }
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      for(int i = 1; i <= tables.length; i++){
        if(result!.code == i.toString() && tables["$i"]["onTable"] == false && isOnTable == false){
          tables["$i"]["onTable"] = true;
          isOnTable = true;
          showDialog(context: context, builder: (context) => AlertDialog(
            backgroundColor: backgroundColor,
            content: Text(
              "Masa oluşturuldu.",
              style: GoogleFonts.inter(
                color: textColor,
                fontSize: 14,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text("Tamam", style: GoogleFonts.inter(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold
                ),
                ),
              ),
            ],
          ));
          break;
        }
      }
    });
  }
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
