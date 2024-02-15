import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../pages/product_add.dart';

class ProductResultCard extends StatelessWidget {
  const ProductResultCard({
    super.key,
    required this.barcodeValue,
  });

  final String barcodeValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(barcodeValue),
            Text(AppLocalizations.of(context)!.helloWorld),
            CupertinoButton(
              onPressed: (){
                Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const ProductAddPage(),
                      settings: RouteSettings(name: '/product_add'),
                    ),
                );
              },
              child: Text("FILL IN THE INFORMATION"),
            )
          ]
        )
      )
    );
  }
}