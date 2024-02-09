import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductResultCard extends StatelessWidget {
  const ProductResultCard({
    super.key,
    required this.barcodeValue,
  });

  final String barcodeValue;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        height: 200,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(barcodeValue),
              Text(AppLocalizations.of(context)!.helloWorld),
              ElevatedButton(
                onPressed: (){

                },
                child: Text("FILL IN THE INFORMATION"),
              )
            ]
          )
        )
      ),
    );
  }
}