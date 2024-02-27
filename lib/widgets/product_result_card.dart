import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../models/product_add_model.dart';
import '../pages/product_add/choose_category_page.dart';

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
                      builder: (context) => ChangeNotifierProvider(
                          create: (_) => ProductAddModel(barcode: barcodeValue),
                          child: const ChooseCategoryPage()
                      ),
                      settings: const RouteSettings(name: '/product_add/choose_category'),
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