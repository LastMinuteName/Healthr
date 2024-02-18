import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'choose_category.dart';
import 'product_add_model.dart';

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({super.key});

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage>{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new ProductAddModel(),
      child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(AppLocalizations.of(context)!.categoryChooseTitle),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: ChooseCategory(),
            ),
          )
      ),
    );
  }
}