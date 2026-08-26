import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'face_capture.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({Key? key}) : super(key: key);

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final MobileScannerController controller = MobileScannerController();

  String? scannedData;
  bool canScan = false;

  Future<void> saveToSharedPreferences(String data) async {
    final prefs = await SharedPreferences.getInstance();
    print("Certificate QR  ");
    print(data);
    await prefs.setString('cert_id', data);
  }

  void onDetect(BarcodeCapture capture) async {
    if (!canScan) return;

    final barcode = capture.barcodes.first;
    final value = barcode.rawValue;

    if (value != null) {
      canScan = false;
      scannedData = value;

      await saveToSharedPreferences(value);
      await controller.stop();

      setState(() {});
    }
  }

  void captureQr() async {
    scannedData = null;
    canScan = true;
    await controller.start();
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: MobileScanner(
              controller: controller,
              onDetect: onDetect,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (scannedData == null)
                  ElevatedButton.icon(
                    icon: const Icon(Icons.qr_code_scanner),
                    label: const Text('Scan Certificate QR'),
                    onPressed: captureQr,
                  )
                else ...[
                  const Text(
                    'Scanned Data:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    scannedData!,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FrontCameraCapturePage(),
                        ),
                      );
                    },
                    child: const Text('Go to Next Page'),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
