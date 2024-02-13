import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:project_greenbook/utils/scanner_error_widget.dart';
import 'package:project_greenbook/utils/product_result_card.dart';

class BarcodeScannerWithScanWindow extends StatefulWidget {
  const BarcodeScannerWithScanWindow({super.key});

  @override
  State<BarcodeScannerWithScanWindow> createState() =>
      _BarcodeScannerWithScanWindowState();
}

class _BarcodeScannerWithScanWindowState extends State<BarcodeScannerWithScanWindow> {
  late MobileScannerController controller = MobileScannerController();
  Barcode? barcode;
  BarcodeCapture? capture;
  bool productScanned = false;

  Future<void> onDetect(BarcodeCapture barcode) async {
    capture = barcode;
    this.barcode = barcode.barcodes.first;

    if (this.barcode!.displayValue != null && productScanned == false) {
      productScanned = true;
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return ProductResultCard(barcodeValue: this.barcode!.displayValue.toString());
        }
      ).whenComplete(() {
        productScanned = false;
      });
    }
  }

  MobileScannerArguments? arguments;

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery
          .of(context)
          .size
          .center(Offset.zero),
      width: MediaQuery
          .of(context)
          .size
          .width * 0.60,
      height: 150,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('With Scan window')),
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          MobileScanner(
            fit: BoxFit.fitHeight,
            scanWindow: scanWindow,
            controller: controller,
            onScannerStarted: (arguments) {
              setState(() {
                this.arguments = arguments;
              });
            },
            errorBuilder: (context, error, child) {
              return ScannerErrorWidget(error: error);
            },
            onDetect: onDetect,
          ),
          CustomPaint(
            painter: ScannerOverlay(scanWindow),
          ),
          /*Align(
            alignment: Alignment.bottomCenter,
            child: () {
              if (barcode?.displayValue != null) {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ProductResultCard(barcodeValue: barcode!.displayValue.toString());
                  }
                );
              }
            }()
          ),*/
        ],
      ),
    );
  }
}

class ScannerOverlay extends CustomPainter {
  ScannerOverlay(this.scanWindow);

  final Rect scanWindow;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPath = Path()..addRect(Rect.largest);
    final cutoutPath = Path()..addRect(scanWindow);

    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );
    canvas.drawPath(backgroundWithCutout, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
