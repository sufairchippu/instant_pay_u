
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScanner extends StatelessWidget {
  const QrCodeScanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        centerTitle: true,
      ),
      body: MobileScanner(
        onDetect: (barcodes) {
          final String? code=Barcode().rawValue;
          if (code!=null) {Navigator.pop(context,code);
            
          }else {
            debugPrint('Failed to scan QR code');
          }

        },
        
        // onDetect: (barcode, args) {
        //   final String? code = barcode.rawValue;
        //   if (code != null) {
        //     Navigator.pop(context, code); // Return the scanned code
        //   } else {
        //     debugPrint('Failed to scan QR code');
        //   }
        // },
        // allowDuplicates: false,
      ),
    );
  }
}