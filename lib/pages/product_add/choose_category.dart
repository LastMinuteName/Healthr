import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthr/models/product_add_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthr/widgets/bordered_card.dart';

class ChooseCategory extends StatelessWidget {
  const ChooseCategory({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    var pageState = context.watch<ProductAddModel>();

    var category = [
      {
        "title": localization!.chooseCategory_foodAndDrinks_title,
        "subtitle": localization!.chooseCategory_foodAndDrinks_subtitle
      },
      {
        "title": localization!.chooseCategory_cosmetic_title,
        "subtitle": localization!.chooseCategory_cosmetic_subtitle
      }
    ];

    List <Widget> widgetList = <Widget>[];

    widgetList.add(
      Text(
        localization.categoryChooseHeader,
        style: CupertinoTheme.of(context).textTheme.textStyle.merge(const TextStyle(fontSize: 26)),
      ),
    );

    widgetList.add(
      const SizedBox(
        height: 16,
      ),
    );

    for (var (index, element) in category.indexed) {
      widgetList.add(
          Center(
              child: BorderedCard(
                title: element["title"]!,
                subtitle: element["subtitle"],
                icon: Icons.favorite,
                height: 100,
                width: 365,
                radius: 20,
              )
          )
      );

      widgetList.add(
        const SizedBox(
          height: 16,
        ),
      );
    }

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(AppLocalizations.of(context)!.categoryChooseTitle),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgetList,
            ),
          )
        ),
    );
  }
}