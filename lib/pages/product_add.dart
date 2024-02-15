import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class _ProductAddModel with ChangeNotifier {
  final productNameController = TextEditingController();
}

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({super.key});

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage>{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.categoryChooseTitle),
      ),
      child: SafeArea(
        child: ChooseCategory(),
      )
    );
  }
}

class ChooseCategory extends StatelessWidget {
  const ChooseCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoButton(
        onPressed: () {  },
        child: Text("test"),
      ),
    );
  }
}