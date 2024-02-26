import 'package:flutter/cupertino.dart';

class ProductAddModel with ChangeNotifier {
  ProductAddModel({
    required this.barcode,
  });

  String barcode;

  final List<String> categories = [
    "Food & Drinks",
    "Cosmetic"
  ];

  int productAddStageIndex = 0;

  int categorySelected = 0;
  String? brandSelected;
  

  var brandNameController = TextEditingController();
  var productNameController = TextEditingController();
  bool organicValue = false;
}