import 'package:flutter/material.dart';
import 'package:qr_code_scanner_generator/generate_qr_code.dart';
import 'package:qr_code_scanner_generator/language_translation.dart';
import 'package:qr_code_scanner_generator/scan_qr_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'QR Code Scanner and Generator',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color(0xff10223d),
      appBar: AppBar(
        title: const Text('Multifunctional App'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ScanQRCode()));
                });
              },
              child: const Text('Scan QR Code'),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const GenerateQRCode()));
                });
              },
              child: const Text('Generate QR Code'),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LanguageTranslationPage()));
                });
              },
              child: const Text('Language Translator'),
            ),
          ],
        ),
      ),
    );
  }
}
