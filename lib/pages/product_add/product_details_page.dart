import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.generalInformationTitle),
        previousPageTitle: AppLocalizations.of(context)!.backButtonText,
        trailing: CupertinoButton(
          onPressed: () {  },
          child: Text(AppLocalizations.of(context)!.cancelButtonText),
        ),
      ),
      child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Placeholder(),
              ]
            ),
          )
      ),
    );
  }
}