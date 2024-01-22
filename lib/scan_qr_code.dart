import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  State<ScanQRCode> createState() {
    return _ScanQRCodeState();
  }
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String qrResult = 'Scanned Data will appear here.';

  Future<void> scanQR() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        qrResult = qrCode.toString();
      });
    } on PlatformException {
      qrResult = 'Failed to read QR Code';
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color(0xff10223d),
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              qrResult,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: scanQR,
              child: const Text('Scan QR'),
            ),
          ],
        ),
      ),
    );
  }
}
