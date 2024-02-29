import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BrandSearchPage extends StatefulWidget {

  @override
  State<BrandSearchPage> createState() => _BrandSearchPageState();
}

class _BrandSearchPageState extends State<BrandSearchPage>{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      navigationBar: pageAppBar(context),
      child: SafeArea(
        child: Placeholder(),
      ),
    );
  }

  CupertinoNavigationBar pageAppBar(BuildContext context) {
    return CupertinoNavigationBar(
      leading: SizedBox(
        height: 37,
        width: 300,
        child: CupertinoSearchTextField(
          placeholder: AppLocalizations.of(context)!.searchFieldText,
        ),
      ),
      trailing: CupertinoButton(
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName('/product_details'));
        },
        padding: const EdgeInsets.all(0),
        child: Text(AppLocalizations.of(context)!.cancelButtonText),
      ),
    );
  }
}

