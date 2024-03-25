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
    this.buttonAction,
  });

  final String barcodeValue;
  final VoidCallback? buttonAction;

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
              onPressed: buttonAction,
              child: Text("FILL IN THE INFORMATION"),
            )
          ]
        )
      )
    );
  }
}