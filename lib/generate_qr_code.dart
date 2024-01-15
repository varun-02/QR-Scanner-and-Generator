import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  State<GenerateQRCode> createState() {
    return _GenerateQRCodeState();
  }
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  TextEditingController urlController = TextEditingController();
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Code Scanner')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (urlController.text.isNotEmpty)
                QrImageView(
                  data: urlController.text.toString(),
                  version: QrVersions.auto,
                  gapless: true,
                  size: 200,
                ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Enter your data',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                  /*Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => QRImage(urlController)));*/
                },
                child: const Text('Generete QR Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
