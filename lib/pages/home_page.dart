import 'package:flutter/material.dart';
import 'package:project_greenbook/pages/product_scan.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BarcodeScannerWithScanWindow(),
                    settings: RouteSettings(name: '/product_scan'),
                  ),
                );
              },
              child: const Text("Scan a product"),
            )
          ],
        ),
      ),
    );
  }
}