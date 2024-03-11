import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthr/pages/product_add/brand_search.dart';
import 'package:healthr/widgets/bordered_card.dart';
import 'package:provider/provider.dart';
import '../../models/product_add_model.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool _pageValidated = false;
  TextEditingController? _productNameController;
  bool _brandValidated = false;
  bool _productValidated = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
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
    ProductAddModel pageState = context.watch<ProductAddModel>();

    /* Initialize the productnamecontroller here instead of initstate because i want access to context*/
    if (_productNameController == null) {
      validateForm(pageState.brandSelected, pageState.productName);
      _productNameController = TextEditingController();
      _productNameController!.text = pageState.productName;
      mountListeners(pageState);
    }

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
                    borderColor: _brandValidated == true ? Colors.green : null,
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => ChangeNotifierProvider.value(
                            value: pageState,
                            child: BrandSearchPage(),
                          ),
                          settings: RouteSettings(name: '/brand_search'),
                        ),
                      );
                    },
                    radius: 5,
                    height: 50,
                    width: 322,
                    title: pageState.brandSelected == null ? AppLocalizations.of(context)!.brandNamePlaceholder : pageState.brandSelected!,
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
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _productValidated ? Colors.green : Theme.of(context).colorScheme.outlineVariant,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                      controller: _productNameController,
                      placeholder: AppLocalizations.of(context)!.productNamePlaceholder,
                    ),
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
                BorderedCard(
                  radius: 5,
                  height: 50,
                  width: 322,
                  title: AppLocalizations.of(context)!.organicText,
                  trailing: CupertinoSwitch(
                    value: pageState.organicValue,
                    onChanged: (bool value) {
                      pageState.updateOrganicValue(value);
                    },
                  ),
                ),
              ]
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
                      onPressed: _pageValidated ? () {} : null,
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

  void validateForm(String? brandName, String productName) {
    brandName != null ? _brandValidated = true : _brandValidated = false;
    productName != "" ? _productValidated = true : _productValidated = false;

    _brandValidated && _productValidated ? setState(() {_pageValidated = true;}) : setState(() {_pageValidated = false;});
  }

  void mountListeners(ProductAddModel pageState) {
    _productNameController!.addListener(() {
      pageState.productName = _productNameController!.text;

      validateForm(pageState.brandSelected, pageState.productName);
    });
  }
}