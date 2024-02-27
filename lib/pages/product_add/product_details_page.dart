import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../models/product_add_model.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: pageAppBar(context),
      child: body(context),
    );
  }

  CupertinoNavigationBar pageAppBar(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(AppLocalizations.of(context)!.generalInformationTitle),
      previousPageTitle: AppLocalizations.of(context)!.backButtonText,
      trailing: CupertinoButton(
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        },
        padding: const EdgeInsets.all(0),
        child: Text(AppLocalizations.of(context)!.cancelButtonText),
      ),
    );
  }

  Widget body(BuildContext context) {
    var pageState = context.watch<ProductAddModel>();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(29.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.productDetailsHeader),
            SizedBox(
              height: 7,
            ),
            LinearProgressIndicator(
              value: 0.01,
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
              child: SizedBox(
                width: 322,
                height: 50,
                child: Text(AppLocalizations.of(context)!.brandNamePlaceholder),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            SizedBox(
              width: 322,
              height: 50,
              child: CupertinoTextField(
                controller: pageState.productNameController,
                placeholder: AppLocalizations.of(context)!.productNamePlaceholder,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Card(
              margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
              child: SizedBox(
                width: 322,
                height: 50,
                child: Text(AppLocalizations.of(context)!.organicText),
              ),
            ),
            SizedBox(
              height: 308,
            ),
            SizedBox(
              width: 322,
              height: 51,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(AppLocalizations.of(context)!.nextButtonText)
              ),
            ),
          ]
        ),
      )
    );
  }
}