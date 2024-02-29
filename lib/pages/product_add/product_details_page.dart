import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthr/widgets/bordered_card.dart';
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
            Row(
              children: [
                SizedBox(
                  width: 7,
                ),
                BorderedCard(
                  onTap: () {},
                  radius: 4,
                  height: 50,
                  width: 322,
                  title: AppLocalizations.of(context)!.brandNamePlaceholder,
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ]
            ),
            SizedBox(
              height: 14,
            ),
            Row(
                children: [
                  SizedBox(
                    width: 7,
                  ),
                  SizedBox(
                    width: 322,
                    height: 50,
                    child: CupertinoTextField(
                      padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                      controller: pageState.productNameController,
                      placeholder: AppLocalizations.of(context)!.productNamePlaceholder,
                    ),
                  ),
                ]
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
            Row(
              children: [
                SizedBox(
                  width: 7,
                ),
                SizedBox(
                  width: 322,
                  height: 51,
                  child: ElevatedButton(
                    onPressed: true ? null : () {},
                    child: Text(AppLocalizations.of(context)!.nextButtonText)
                  ),
                ),
              ],
            ),
          ]
        ),
      )
    );
  }
}