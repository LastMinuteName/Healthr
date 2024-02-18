import 'package:flutter/cupertino.dart';

class ProductAddModel with ChangeNotifier {
  int productAddStageIndex = 0;

  String category = "Food & Drinks";

  var brandNameController = TextEditingController();
  var productNameController = TextEditingController();
  bool organicValue = false;
}