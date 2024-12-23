import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:healthr/pages/product_add/choose_category_page.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:healthr/widgets/scanner_error_widget.dart';
import 'package:healthr/widgets/product_result_card.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../models/product_add_model.dart';

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

  /*TODO: Pause or dispose of the controller when the page is no longer in focus but still remains in the context/widget stack from navigating. When page resumes start or reinitialize the controller.*/
  Future<void> onDetect(BarcodeCapture barcode) async {
    capture = barcode;
    this.barcode = barcode.barcodes.first;

    if (this.barcode!.displayValue != null && productScanned == false) {
      productScanned = true;
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return ProductResultCard(barcodeValue: this.barcode!.displayValue.toString(), buttonAction: () {
            controller.stop();

            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (_) => ProductAddModel(barcode: this.barcode!.displayValue.toString()),
                  child: const ChooseCategoryPage()
                ),
                settings: const RouteSettings(name: '/product_add/choose_category'),
              ),
            ).then((_) {
              controller.start();
            });
          },);
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
          SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: IconButton(
                    color: Colors.white,
                    icon: ValueListenableBuilder<TorchState>(
                      valueListenable: controller.torchState,
                      builder: (context, state, child) {
                        switch (state) {
                          case TorchState.off:
                            return const Icon(
                              Icons.flashlight_off,
                              color: Colors.white,
                            );
                          case TorchState.on:
                            return const Icon(
                              Icons.flashlight_on,
                              color: Colors.yellow,
                            );
                        }
                      },
                    ),
                    iconSize: 32.0,
                    onPressed: () => controller.toggleTorch(),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    AppLocalizations.of(context)!.scanHeader,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ]
            )
          )
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
