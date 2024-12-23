import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthr/pages/product_scan.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/product_result_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.homeTitle),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const BarcodeScannerWithScanWindow(),
                    settings: RouteSettings(name: '/product_scan'),
                  ),
                );
              },
              child: const Text("Scan a product"),
            ),
            CupertinoButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ProductResultCard(barcodeValue: "9324441045460");
                    }
                );
              },
              child: const Text("Test add a product"),
            ),
          ],
        ),
      ),
    );
  }
}