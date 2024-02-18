import 'package:flutter/cupertino.dart';

class ProductAddModel with ChangeNotifier {
  List<String> categoryList = [
    "Food & Drinks",
    "Cosmetic"
  ];

  int productAddStageIndex = 0;

  int category = 0;

  var brandNameController = TextEditingController();
  var productNameController = TextEditingController();
  bool organicValue = false;

  void nextStage() {
    productAddStageIndex++;
  }

  void prevStage() {
    if (productAddStageIndex > 0) {
      productAddStageIndex--;
    }
  }
}